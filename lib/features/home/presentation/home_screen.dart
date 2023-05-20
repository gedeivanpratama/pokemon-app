import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/features/home/presentation/provider/habitats_provider.dart';
import 'package:flutter_technical_test/features/home/presentation/provider/pokemons_provider.dart';
import 'package:flutter_technical_test/features/home/presentation/provider/search_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const DrawerWidget(),
      body: ListView(
        children: [
          Text(
            "habitat",
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 80),
            child: Consumer(builder: (context, ref, _) {
              final result = ref.watch(fetchHabitatProvider);
              return result.when(data: (data) {
                return data.fold((l) {
                  return Center(child: Text(l.message));
                }, (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.habitats.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {},
                        child: Text(data.habitats[index].name),
                      );
                    },
                  );
                });
              }, error: (_, __) {
                return const Center(child: Text("error"));
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              });
            }),
          ),
          Text(
            "Pokemon List",
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          Consumer(builder: (context, ref, _) {
            return Visibility(
              visible: !ref.watch(searchToggleProvider),
              child: const PokemonListWidget(),
            );
          }),
        ],
      ),
    );
  }
}

class PokemonListWidget extends ConsumerWidget {
  const PokemonListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(fetchPokemonProvider);
    return result.when(data: (data) {
      return data.fold((l) {
        return Center(child: Text(l.message));
      }, (data) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: data.pokemons.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Card(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add),
                  ),
                ),
                Image.network(
                  data.pokemons[index].image,
                  width: double.infinity,
                  height: 200,
                  errorBuilder: (context, _, __) {
                    return Image.asset("assets/images/no_image.jpg");
                  },
                ),
                Text(
                  data.pokemons[index].name,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ));
          },
        );
      });
    }, error: (_, __) {
      return const Center(child: Text("error"));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearch = ref.watch(searchToggleProvider);
    final textField = ref.watch(textFieldProvider);

    return AppBar(
      centerTitle: true,
      title: isSearch
          ? TextField(
              showCursor: true,
              textInputAction: TextInputAction.search,
              controller: textField,
              onSubmitted: (String search) {
                log(search);
                final setTextField = ref.read(textFieldProvider.notifier);
                setTextField.update((state) => state..text = search);
              },
            )
          : Text(
              "Pokemon App",
              style: Theme.of(context).textTheme.displayLarge,
            ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark),
        ),
        IconButton(
          onPressed: () {
            ref.read(searchToggleProvider.notifier).update((state) => !state);
          },
          icon: isSearch ? const Icon(Icons.close) : const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("Ask Questions"),
            ),
          ],
        ),
      ),
    );
  }
}
