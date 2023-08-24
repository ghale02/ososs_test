import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_test/logic/controllers/home.dart';
import 'package:ososs_test/logic/models/home.dart';
import 'package:ososs_test/ui/screens/animations.dart';
import 'package:ososs_test/utils/app_routes.dart';

class HomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Builder(builder: (context) {
                    return TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(hintText: 'Enter your name'),
                      onChanged: (value) =>
                          context.read<HomeCubit>().setName(value),
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocSelector<HomeCubit, HomeState, String>(
                    selector: (state) {
                      return state.nameText;
                    },
                    builder: (context, state) {
                      // here trim is used in order to keep the text in the center
                      return Text(
                        state.trim(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Builder(builder: (context) {
                    return TextButton.icon(
                      onPressed: () {
                        context.read<HomeCubit>().setName('');
                        nameController.clear();
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Clear text'),
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.error)),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style
                        ?.copyWith(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.secondary)),
                    onPressed: () => Navigator.of(context).pushNamed(
                        AppRoutes.animations,
                        arguments:
                            AnimationsArgs(name: nameController.text.trim())),
                    child: const Text('Go to page 1'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.pokemons),
                    child: const Text('Go to page 2'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
