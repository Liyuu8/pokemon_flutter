import 'package:flutter/material.dart';
import 'package:pokemon_flutter/models/notifier/fav_pokemon.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_flutter/consts/pokeapi.dart';
import 'package:pokemon_flutter/components/poke_list_item.dart';
import 'package:pokemon_flutter/components/view_mode_bottom_sheet.dart';
import 'package:pokemon_flutter/models/notifier/pokemon.dart';

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int pageSize = 30;

  bool isFavMode = false;
  int _currentPage = 1;

  int getItemCount(int page, int favCount) {
    int ret = page * pageSize;
    if (isFavMode && ret > favCount) ret = favCount;
    if (ret > pokeMaxId) ret = pokeMaxId;

    return ret;
  }

  bool isMorePage(int page, int favCount) {
    return page * pageSize < (isFavMode ? favCount : pokeMaxId);
  }

  void onPressFavMode() async {
    var ret = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) =>
          ViewModeBottomSheet(favMode: isFavMode),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );

    if (ret != null && ret) setState(() => isFavMode = !isFavMode);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavPokeNotifier>(
      builder: (context, favPokeNotifier, child) => Column(
        children: [
          Container(
            height: 24,
            alignment: Alignment.topRight,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onPressFavMode,
              icon: const Icon(Icons.auto_awesome_outlined),
            ),
          ),
          Expanded(
            child: Consumer<PokemonNotifier>(
              builder: (context, pokemonNotifier, child) => getItemCount(
                        _currentPage,
                        favPokeNotifier.favList.length,
                      ) ==
                      0
                  ? const Text('no data')
                  : ListView.builder(
                      itemBuilder: (context, index) => index !=
                              getItemCount(
                                _currentPage,
                                favPokeNotifier.favList.length,
                              )
                          ? PokeListItem(
                              poke: pokemonNotifier.byId(
                                isFavMode
                                    ? favPokeNotifier.favList[index].pokeId
                                    : index + 1,
                              ),
                            )
                          : isMorePage(
                              _currentPage,
                              favPokeNotifier.favList.length,
                            )
                              ? OutlinedButton(
                                  onPressed: () =>
                                      setState(() => _currentPage++),
                                  child: const Text('more'),
                                )
                              : const Text(''),
                      itemCount: getItemCount(
                            _currentPage,
                            favPokeNotifier.favList.length,
                          ) +
                          1,
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
