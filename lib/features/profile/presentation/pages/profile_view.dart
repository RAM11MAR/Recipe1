import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/features/profile/presentation/pages/profile_view_model.dart';

import '../widgets/bottom_nav_bar2.dart';
import '../widgets/category_item.dart';
import '../widgets/favorites_item.dart';
import '../widgets/following.dart';
import '../widgets/profile_share_edit.dart';

class ProfileView extends StatelessWidget implements PreferredSizeWidget {
  const ProfileView({
    super.key,
    required this.viewModel,
  });

  final ProfileViewModel viewModel;

  @override
  Size get preferredSize => const Size(double.infinity, 241);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => DefaultTabController(
        length: 2,
        child: switch (viewModel.loading) {
          true => Center(child: CircularProgressIndicator()),
          false => Scaffold(
              appBar: AppBar(
                toolbarHeight: 97,
                title: Row(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 102,
                      height: 97,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: Image.network(
                          viewModel.profile!.profilePhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 72,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.profile!.fullName,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "@${viewModel.profile!.username}",
                            style: TextStyle(
                              color: Color(0xFFEC888D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            viewModel.profile!.presentation,
                            style: TextStyle(
                              color: Color(0xFFFFFDF9),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 61,
                      height: 28,
                      child: Row(
                        spacing: 4,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xFFFFC6C9),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/heart.svg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xFFFFC6C9),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/others.svg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size(356, 125),
                  child: Column(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: 356,
                        height: 83,
                        child: Column(
                          spacing: 5,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                ProfileShareEdit(title: "Edit Profile"),
                                ProfileShareEdit(title: "Share Profile"),
                              ],
                            ),
                            Following(viewModel: viewModel)
                          ],
                        ),
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Text(
                            "Recipes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Favorites",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              extendBody: true,
              body: TabBarView(
                children: [
                  GridView.builder(
                    padding: EdgeInsets.all(8),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 150,
                    ),
                    itemCount: viewModel.recipes.length,
                    itemBuilder: (context, index){
                      return CategoryItem(
                        image: viewModel.recipes[index].photo,
                        title: viewModel.recipes[index].title,
                        desc: viewModel.recipes[index].description,
                        rating: viewModel.recipes[index].rating,
                        duration: viewModel.recipes[index].timeRequired,
                      );
                    },
                    //
                  ),
                  ListView(
                    padding: EdgeInsets.all(8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      FavoritesItem(
                          title: "Sweet", image: "assets/recipe/cake.png"),
                      SizedBox(height: 50),
                      FavoritesItem(
                          title: "Salty", image: "assets/recipe/breakfast.png"),
                      SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Color(0xFF1C0F0D),
                            ),
                          ),
                          child:
                              ProfileShareEdit(title: "+ Create Collection")),
                    ],
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.all(8.0),
                child: BottomNavBar2(),
              ),
            ),
        },
      ),
    );
  }
}

//children: [
//   CategoryItem(
//     image: "assets/recipe/eggs.png",
//     title: "Eggs Benedict",
//     desc: "Muffin with Canadian bacon",
//     rating: "5",
//     duration: "15min",
//   ),
//   CategoryItem(
//     image: "assets/recipe/franch_toast.png",
//     title: "French Toast",
//     desc: "Delicious slices of bread",
//     rating: "5",
//     duration: "20min",
//   ),
//   CategoryItem(
//     image: "assets/recipe/oatmeal.png",
//     title: "Oatmeal and Nut ",
//     desc: "Wholesome blend for breakfast",
//     rating: "4",
//     duration: "35min",
//   ),
//   CategoryItem(
//     image: "assets/recipe/tortilla.png",
//     title: "Still Life Potato",
//     desc: "Earthy, textured, rustic charm",
//     rating: "4",
//     duration: "30min",
//   ),
//   CategoryItem(
//     image: "assets/recipe/oatmel.png",
//     title: "Oatmeal and Granola",
//     desc: "Strawberries and Blueberries",
//     rating: "4",
//     duration: "30min",
//   ),
//   CategoryItem(
//     image: "assets/recipe/sunny_bruscheta.png",
//     title: "Sunny Bruschetta",
//     desc: "With Cream Cheese",
//     rating: "4",
//     duration: "30min",
//   ),
//   CategoryItem(
//     image: "assets/recipe/omelette.png",
//     title: "Omelette Cheese",
//     desc: "Fresh Parsley",
//     rating: "4",
//     duration: "30min",
//   ),
//   CategoryItem(
//     image: "assets/recipe/tofu_sandwich.png",
//     title: "Tofu Sandwich",
//     desc: "Microgreens",
//     rating: "4",
//     duration: "30min",
//   ),
// ],
