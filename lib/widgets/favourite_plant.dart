import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_challenge_heyflutter/providers/favourite_plants_provider.dart';
import 'package:ui_challenge_heyflutter/screens/plant_detail.dart';

class FavouritePlant extends ConsumerStatefulWidget {
  const FavouritePlant({super.key});

  @override
  ConsumerState<FavouritePlant> createState() => _FavouritePlantState();
}

class _FavouritePlantState extends ConsumerState<FavouritePlant> {
  @override
  Widget build(BuildContext context) {
    final favouritePlants = ref.watch(favouritePlantProvider);
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              childAspectRatio: 2 / 4,
            ),
            itemCount: favouritePlants.length,
            padding: const EdgeInsets.all(25),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return PlantDetailScreen(
                          plant: favouritePlants[index],
                        );
                      },
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                favouritePlants[index].image,
                              ),
                            ),
                          ),
                          Text(
                            favouritePlants[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "\$${favouritePlants[index].price}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ref
                                          .read(favouritePlantProvider.notifier)
                                          .plantFavouriteStatus =
                                      favouritePlants[index];
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    color: favouritePlants
                                            .contains(favouritePlants[index])
                                        ? Colors.red
                                        : Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
