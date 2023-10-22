import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_challenge_heyflutter/model/plant.dart';

class FavouritePlantsNotifier extends StateNotifier<List<Plant>> {
  FavouritePlantsNotifier() : super(const []);

  set plantFavouriteStatus(Plant plant) {
    final isPlantFavourite = state.contains(plant);

    if (isPlantFavourite) {
      state = [...state.where((element) => element.id != plant.id).toList()];
    } else {
      state = [plant, ...state];
    }
  }

  List<Plant> get data {
    return state;
  }
}

final favouritePlantProvider =
    StateNotifierProvider<FavouritePlantsNotifier, List<Plant>>(
  (ref) => FavouritePlantsNotifier(),
);
