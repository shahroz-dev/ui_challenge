import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ui_challenge_heyflutter/data/available_plants.dart';
import 'package:ui_challenge_heyflutter/providers/plants_provider.dart';
import 'package:ui_challenge_heyflutter/screens/plant_detail.dart';

class PlantsScreen extends ConsumerWidget {
  const PlantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availablePlants = ref.read(plantsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
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
      body: Column(
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
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        size: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
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
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.filter_alt,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
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
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.white,
                                    size: 20,
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
      ),
    );
  }
}
