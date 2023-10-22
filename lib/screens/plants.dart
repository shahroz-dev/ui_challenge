import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_challenge_heyflutter/providers/favourite_plants_provider.dart';
import 'package:ui_challenge_heyflutter/widgets/available_plants.dart';
import 'package:ui_challenge_heyflutter/widgets/favourite_plant.dart';

class PlantsScreen extends ConsumerStatefulWidget {
  const PlantsScreen({super.key});

  @override
  ConsumerState<PlantsScreen> createState() => _PlantsScreenState();
}

int _selectedPageIndex = 0;
late Widget _activeScreen;
late final _plantFuture;

class _PlantsScreenState extends ConsumerState<PlantsScreen> {
  @override
  void initState() {
    _plantFuture = ref.read(favouritePlantProvider.notifier).loadPlants();
    super.initState();
  }

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
      body: FutureBuilder(
          future: _plantFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _activeScreen),
      // _activeScreen,
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
