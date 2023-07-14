import 'package:blood_link/providers/user_provider.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/bodies.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).refreshUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        backgroundColor: Colors.white24,
        title: const Text("Home"),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        showSelectedLabels: true,
        elevation: 5,
        iconSize: 18,
        showUnselectedLabels: false,
        backgroundColor: mobileBackgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype_outlined),
            label: "Request",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_quote_outlined),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: "Profile",
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
