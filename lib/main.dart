import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Index for id pages, drawer items
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PageWidget("Home", Color.fromARGB(255, 219, 255, 240), 'home'),
    const PageWidget("Red", Colors.red, 'red'),
    const PageWidget("Blue", Colors.blue, 'blue'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: 'appbar', // Unique tag for AppBar
          child: Text('Project 4'),
        ),
      ),
      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[            
            const SizedBox(height: 30),
            const SizedBox(
              height: 80.0,
              child: DrawerHeader(
                child: Text(
                  'Choose which you want',
                  style: TextStyle(color: Colors.black)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),                  
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.fromLTRB(15, 0, 20, 0),                  
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Red'),
              tileColor: Colors.redAccent,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Blue'),
              tileColor: Colors.blueAccent,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
      // Using index for switching items in Floating Button
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(150, 590, 0, 0),
            items: <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  title: const Text('Red'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: const Text('Blue'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
              )
            ],
            elevation: 8.0,
          );
        },
        child: const Icon(Icons.add),
      ),
      // Bottom navigation bar for switching between pages
      bottomNavigationBar: AnimatedBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String tag; // Tag for Hero animation

  // Constructor for page widgets
  const PageWidget(this.text, this.color, this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        // Hero animation
        child: Hero(
          tag: tag, // Unique tag for each page
          child: Text(
            text,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

// Bottom Navigation Bar
class AnimatedBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  // Counstructor for botoom navigation bar
  AnimatedBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabChanged,
  });

  // Widget build for each element in Bottom navigation bar
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTabChanged,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Red pill',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Blue pill',
        ),
      ],
    );
  }
}
