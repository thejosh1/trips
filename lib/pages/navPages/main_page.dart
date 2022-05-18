import 'package:flutter/material.dart';
import 'package:trips/pages/navPages/bar_item_pages.dart';
import 'package:trips/pages/home_page.dart';
import 'package:trips/pages/navPages/my_page.dart';
import 'package:trips/pages/navPages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
  const HomePage(),
  const BarItemPage(),
  const SearchPage(),
  const MyPage()
];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Main Page"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: "Bar item Page"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search Page"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My page")
        ],
      ),
    );
  }
}
