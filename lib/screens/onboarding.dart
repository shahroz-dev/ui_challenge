import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_challenge_heyflutter/model/plant.dart';
import 'package:ui_challenge_heyflutter/providers/available_plants_provider.dart';
import 'package:ui_challenge_heyflutter/screens/plants.dart';
import 'package:ui_challenge_heyflutter/widgets/image_crousel_slider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

int _activeIndex = 0;
late final List<Plant> plants;

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  void initState() {
    plants = ref.read(availablePlantsProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ImageCarouselSlider(
              plants: plants,
              onImageSlide: (index) {
                setState(
                  () {
                    _activeIndex = index;
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          buildIndicator(context),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enjoy your",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: "Life with ",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Plants",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlantsScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}

Widget buildIndicator(BuildContext context) {
  return AnimatedSmoothIndicator(
    activeIndex: _activeIndex,
    count: plants.length,
    effect: SlideEffect(
      dotWidth: 10,
      dotHeight: 10,
      activeDotColor: Theme.of(context).colorScheme.primary,
    ),
  );
}
