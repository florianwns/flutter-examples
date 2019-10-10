import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final _pages = [
    {
      'page': CategoriesScreen(),
      'title': Text('Categories'),
      'icon': Icon(Icons.category)
    },
    {
      'page': FavoritesScreen(),
      'title': Text('Favorites'),
      'icon': Icon(Icons.star),
    },
  ];

  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_pageIndex]['title'],
      ),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _pageIndex,
        items: _pages.map(
          (page) => BottomNavigationBarItem(
            icon: page['icon'],
            title: page['title'],
          ),
        ).toList(),
      ),
    );
  }
}
