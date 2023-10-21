import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_challenge_heyflutter/data/plants_data.dart';

final availablePlantsProvider = Provider((ref) {
  return availablePlant;
});

//this method is used for static data that doesn't needs to be changed
