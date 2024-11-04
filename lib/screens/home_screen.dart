import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/cubit/cubit.dart';
import 'package:new_project/screens/screens.dart';
import 'package:new_project/widgets/custom_elevated_button.dart';
import 'package:new_project/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onBoarding.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned.fill(child: DecorationContainer()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocListener<NewsCubit, NewsState>(
                  listener: (context, NewsState state) {
                    if (state is NewsSuccessState) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NewsScreen(),
                        ),
                      );
                    }
                  },
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: BlocBuilder<NewsCubit, NewsState>(
                            builder: (context, NewsState state) {
                              if (state is NewsLoadingState &&
                                  state.loadingButtonIndex == 0) {
                                return const CircularProgressIndicator();
                              } else {
                                return CustomElevatedButton(
                                  buttonText: 'Latest News',
                                  onPressed: () async {
                                    context.read<NewsCubit>().getNewsData(0);
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: BlocBuilder<NewsCubit, NewsState>(
                            builder: (context, NewsState state) {
                              if (state is NewsLoadingState &&
                                  state.loadingButtonIndex == 1) {
                                return const CircularProgressIndicator();
                              } else {
                                return CustomElevatedButton(
                                  buttonText: 'Second to Latest News',
                                  onPressed: () async {
                                    context.read<NewsCubit>().getNewsData(1);
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
