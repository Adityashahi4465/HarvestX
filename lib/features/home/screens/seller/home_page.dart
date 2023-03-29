import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harvestx/features/home/screens/for_both/shop_screen.dart';
import 'package:harvestx/features/home/screens/seller/dashboard.dart';

import '../../../../core/common/bottom_nev_bar/bottom_nev_bar.dart';

class SellerHomePage extends StatefulWidget {
  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  int currentIndex = 0;

  final List _tabIcons = List.unmodifiable([
    {'icon': Icons.shop, 'title': 'Shop'},
    {'icon': Icons.menu_book_outlined, 'title': 'Recipes'},
    {'icon': Icons.shopping_cart, 'title': 'Cart'},
    {'icon': Icons.dashboard, 'title': 'Dashboard'},
    {'icon': Icons.upload, 'title': 'Upload'},
  ]);

  final List<Widget> _tabs = List.unmodifiable([
    const ShopScreen(),
    Container(),
    Container(),
    const DashboardScreen(),
    Container(),
  ]);

  void onTabChanged(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[currentIndex],
      bottomNavigationBar: NavBar(
        tabIcons: _tabIcons,
        activeIndex: currentIndex,
        onTabChanged: onTabChanged,
      ),
    );
  }
}
