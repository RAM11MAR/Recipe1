import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/recipe_elevated_button.dart';
import 'onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.viewModel});

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) => PageView.builder(
          controller: viewModel.controller,
          itemCount: viewModel.onboardingList.length + 1,
          itemBuilder: (context, index) {
            if (index >= viewModel.onboardingList.length) {
              return Scaffold(
                backgroundColor: Color(0xFF1C0F0D),
                appBar: AppBar(
                  backgroundColor: Color(0xFF1C0F0D),
                  leadingWidth: 90,
                  leading: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/myassets/back.svg",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
                extendBody: true,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/myassets/categories.png",
                        width: 356,
                        height: 557,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        maxLines: 3,
                        "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RecipeElevatedButton(
                            callback: () {}, text: "I'm New"),
                        RecipeElevatedButton(
                            callback: () {}, text: "I've Been Here"),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: NetworkImage(viewModel.onboardingList[index].picture),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C0F0D),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1C0F0D), Colors.transparent],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        spacing: 15,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.onboardingList[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            viewModel.onboardingList[index].subtitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1C0F0D), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 48),
                  child: RecipeElevatedButton(
                      callback: () => viewModel.controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                      ),
                      text: "Continue"),
                ),
              ],
            );
          },
          onPageChanged: (index) =>
              viewModel.pageChangedCallBack(index, context),
        ),
      ),
    );
  }
}