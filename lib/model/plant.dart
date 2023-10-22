import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Plant {
  final String name;
  final String height;
  final String temperature;
  final double price;
  final String pot;
  final String image;
  final String id;
  Plant({
    required this.name,
    required this.height,
    required this.temperature,
    required this.price,
    required this.pot,
    required this.image,
    required this.id,
  });
}
