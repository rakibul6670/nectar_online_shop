import 'package:flutter/material.dart';
import 'package:nectar_online_shop/business/providers/bottom_nav_provider.dart';
import 'package:nectar_online_shop/presentation/screens/account_screen.dart';
import 'package:nectar_online_shop/presentation/screens/cart_screen.dart';
import 'package:nectar_online_shop/presentation/screens/explore_screen.dart';
import 'package:nectar_online_shop/presentation/screens/favorites_screen.dart';
import 'package:nectar_online_shop/presentation/screens/shop_screen.dart';
import 'package:provider/provider.dart';

class MainNavBarHolderScreen extends StatelessWidget {
  MainNavBarHolderScreen({super.key});

  //-------------------- screen list -----------------
  final List<Widget> screens = [
    ShopScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoritesScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavProvider(),
      child: Scaffold(
        //========================== Body Section =========================
        body: SafeArea(
          child: Consumer<BottomNavProvider>(
            builder: (context, provider, child) {
              return screens[provider.selectedIndex];
            },
          ),
        ),

        //============================ Bottom Navigation Bar =================
        bottomNavigationBar: Consumer<BottomNavProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 4,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: provider.selectedIndex,
              onTap: (value) {
                provider.onTapChangeScreen(value);
              },
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Shop",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.manage_search),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Account",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
