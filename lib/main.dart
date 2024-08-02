import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Carousel',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/bench.jpg',
      'assets/cafe.jpg',
      'assets/cardio.jpg',
      'assets/machines.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('LA FITNESSE '),
      ),
      body: Container(
        color: Colors.pink[50], // Set background color
        child: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
            ),
            items: imgList.map((item) => Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                ),
              ),
            )).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
