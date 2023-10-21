import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_challenge_heyflutter/model/plant.dart';

class FavouritePlantsNotifier extends StateNotifier<List<Plant>> {
  FavouritePlantsNotifier() : super(const []);

  void addPlant(Plant plant) {
    state = [plant, ...state];
  }

  List<Plant> get data {
    return state;
  }
}

final favouritePlantProvider =
    StateNotifierProvider<FavouritePlantsNotifier, List<Plant>>(
  (ref) => FavouritePlantsNotifier(),
);
