import 'package:flutter/material.dart';
import 'package:ui_challenge_heyflutter/widgets/available_plants.dart';
import 'package:ui_challenge_heyflutter/widgets/favourite_plant.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({super.key});

  @override
  State<PlantsScreen> createState() => _PlantsScreenState();
}

int _selectedPageIndex = 0;
late Widget _activeScreen;

class _PlantsScreenState extends State<PlantsScreen> {
  void _selectedPage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedPageIndex == 0) {
      _activeScreen = const AvailablePlant();
    } else {
      _activeScreen = const FavouritePlant();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedPageIndex == 0 ? "Available Plants" : "Favourite Plants",
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.person,
              size: 35,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green.shade50,
      body: _activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
            ),
            label: "Available",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}
