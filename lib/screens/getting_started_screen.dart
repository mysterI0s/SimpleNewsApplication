import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/cubit/cubit.dart';
import 'package:new_project/screens/screens.dart';
import 'package:new_project/widgets/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

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
          const Positioned.fill(
            child: DecorationContainer(),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Stay Informed\nfrom Day One',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Discover the Latest News with our\nSeamless Onboarding Experience',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: BlocConsumer<NewsCubit, NewsState>(
                    listener: (context, state) {
                      if (state is NewsSuccessState) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AllNewsScreen(),
                          ),
                        );
                      } else if (state is NewsErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                      }
                    },
                    builder: (BuildContext context, NewsState state) {
                      if (state is NewsLoadingState) {
                        return const SpinKitFadingCube(
                          color: Colors.white,
                        );
                      } else {
                        return Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              buttonText: "Get Started",
                              onPressed: () {
                                context.read<NewsCubit>().getNewsData();
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
