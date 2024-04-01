import 'package:flutter/material.dart';
import '/widgets/page_widget.dart';
import '/widgets/animated_navigation_bar.dart';
import '/widgets/floating_action_button.dart';
import '/screens/drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: 'appbar', // Unique tag for AppBar
          child: Text('Project 5'),
        ),
      ),
      drawer: DrawerScreen(onTap: _onItemTapped),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButtonWidget(
        onTap: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChanged: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const PageWidget("Home", Color.fromARGB(255, 69, 179, 93), 'home'),
    const PageWidget("Red", Colors.red, 'red'),
    const PageWidget("Blue", Colors.blue, 'blue'),
  ];
}
