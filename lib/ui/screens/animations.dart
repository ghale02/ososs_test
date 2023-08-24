import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_test/logic/controllers/animations.dart';
import 'package:ososs_test/logic/models/animations.dart';
import 'package:ososs_test/utils/shapes.dart';

// I add this class for every screen that receives arguments
// if we have more arguments I add it to this class
class AnimationsArgs {
  String name;
  AnimationsArgs({
    required this.name,
  });
}

class AnimationsPage extends StatelessWidget {
  final AnimationsArgs args;
  const AnimationsPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimationsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animations'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              Visibility(
                visible: args.name.isNotEmpty,
                child: Center(
                  child: Text(
                    args.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              Visibility(
                visible: args.name.isNotEmpty,
                child: const SizedBox(
                  height: 32,
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                    builder: (context, box) =>
                        BlocBuilder<AnimationsCubit, AnimationsState>(
                          builder: (context, state) {
                            return Align(
                              alignment: Alignment.topCenter,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: box.maxWidth,
                                height: box.maxWidth,
                                decoration:
                                    state.shape.decoration(box.maxWidth),
                              ),
                            );
                          },
                        )),
              ),
              Builder(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context
                          .read<AnimationsCubit>()
                          .setShape(AppShape.square),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: AppShape.square.decoration(50),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<AnimationsCubit>()
                          .setShape(AppShape.roundedSquare),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: AppShape.roundedSquare.decoration(50),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<AnimationsCubit>()
                          .setShape(AppShape.circle),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: AppShape.circle.decoration(50),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
