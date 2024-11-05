import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/cubit/cubit.dart';
import 'package:new_project/screens/screens.dart';
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
                              if (state is NewsLoadingState) {
                                return const CircularProgressIndicator();
                              } else {
                                return CustomElevatedButton(
                                  buttonText: 'Discover What\'s new',
                                  onPressed: () async {
                                    context.read<NewsCubit>().getNewsData();
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
