import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_challenge_heyflutter/providers/available_plants_provider.dart';
import 'package:ui_challenge_heyflutter/providers/favourite_plants_provider.dart';
import 'package:ui_challenge_heyflutter/screens/plant_detail.dart';

class AvailablePlant extends ConsumerWidget {
  const AvailablePlant({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availablePlants = ref.read(availablePlantsProvider);
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: 40,
                color: Theme.of(context).colorScheme.onPrimary,
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const TextField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.onPrimary,
                child: const Icon(
                  Icons.filter_alt,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              childAspectRatio: 2 / 4,
            ),
            itemCount: availablePlants.length,
            padding: const EdgeInsets.all(25),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return PlantDetailScreen(
                          plant: availablePlants[index],
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
                                availablePlants[index].image,
                              ),
                            ),
                          ),
                          Text(
                            availablePlants[index].name,
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
                                "\$${availablePlants[index].price}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ref
                                      .read(favouritePlantProvider.notifier)
                                      .addPlant(
                                        availablePlants[index],
                                      );
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.white,
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
