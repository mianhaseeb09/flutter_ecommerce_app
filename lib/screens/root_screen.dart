import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/color/colors.dart';
import 'package:flutter_ecommerce_app/model/data.dart';
import 'package:flutter_ecommerce_app/screens/account_screen.dart';
import 'package:flutter_ecommerce_app/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/screens/home_screen.dart';
import 'package:flutter_ecommerce_app/screens/more_screen.dart';
import 'package:flutter_ecommerce_app/screens/store_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int activeTab = 0;
  void appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getBottomNavigationBar(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  getBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(itemsTab.length, (index) {
            return IconButton(
              icon: Icon(
                itemsTab[index]['icon'],
                size: itemsTab[index]['size'],
                color: activeTab == index ? accent : black,
              ),
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }

  getAppBar() {
    switch (activeTab) {
      case 0:
        appBar = null;
        break;
      case 1:
        appBar = null;
        break;
      case 2:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: const Center(
            child: Text(
              'ACCOUNT',
              style: TextStyle(color: black),
            ),
          ),
        );

      case 3:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: const Center(
            child: Text(
              'CART',
              style: TextStyle(color: black),
            ),
          ),
        );

      case 4:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: const Center(
            child: Text(
              'MORE',
              style: TextStyle(color: black),
            ),
          ),
        );
      default:
    }
  }

  getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomeScreen(),
        StoreScreen(),
        AccountScreen(),
        CartScreen(),
        MoreScreen()
      ],
    );
  }
}
