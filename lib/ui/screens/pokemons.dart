import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_test/logic/controllers/pokemons.dart';
import 'package:ososs_test/logic/models/pokemons.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  ScrollController generateController(PokemonsCubit cubit) {
    ScrollController controller = ScrollController();
    controller.addListener(() async {
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange &&
          !cubit.state.loading &&
          cubit.state.thereMore) {
        await cubit.load();
      }
    });
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pokemons"),
        ),
        body: BlocBuilder<PokemonsCubit, PokemonsState>(
          buildWhen: (previous, current) =>
              previous.loading != current.loading && !previous.loaded,
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!state.loading && !state.loaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error occurred.',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextButton(
                      onPressed: () => context
                          .read<PokemonsCubit>()
                          .load()
                          .then((value) => null),
                      child: const Text('Try Again'))
                ],
              );
            }
            return Column(
              children: [
                Expanded(
                  child: BlocSelector<PokemonsCubit, PokemonsState, List>(
                    selector: (state) => state.items,
                    builder: (context, state) => ListView.builder(
                      controller:
                          generateController(context.read<PokemonsCubit>()),
                      padding: const EdgeInsets.all(16),
                      itemCount: state.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                              ),
                              child: SizedBox.square(
                                dimension: 100,

                                // the id of pokemons after 1010 not continues to 1011
                                // it's 10001 and the next one  10002... so we have to re-format id after index 1009
                                // more on that in readme.md file
                                child: Builder(builder: (context) {
                                  String id;
                                  if (index < 1009) {
                                    id = (index + 1).toString();
                                  } else {
                                    // we need use 10ddd format where ddd is 3 digests
                                    //determine how many zero we need for last 3 digests
                                    String zerosPrefix = List.generate(
                                        3 - (index - 1009).toString().length,
                                        (_) => '0').join();
                                    id =
                                        "10$zerosPrefix${index + 1009}"; // 10 static prefix
                                  }
                                  return Image.network(
                                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png",
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) => Center(
                                      child: Text(
                                        'Not\nfound',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error),
                                      ),
                                    ),
                                    loadingBuilder: (context, child,
                                            loadingProgress) =>
                                        Visibility(
                                            visible: loadingProgress != null &&
                                                loadingProgress
                                                        .cumulativeBytesLoaded <
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        0),
                                            replacement: child,
                                            child: const Center(
                                              child: SizedBox.square(
                                                  dimension: 32,
                                                  child:
                                                      CircularProgressIndicator()),
                                            )),
                                  );
                                }),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 8, top: 8),
                              child: Text(
                                state[index]['name'],
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                BlocSelector<PokemonsCubit, PokemonsState, bool>(
                  selector: (state) => state.loading,
                  builder: (context, state) {
                    return Visibility(
                        visible: state,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ));
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
