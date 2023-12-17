import 'package:flutter/material.dart';

import 'utils.dart';

class CustomNavigationRail extends StatefulWidget {
  const CustomNavigationRail({super.key});

  @override
  State<CustomNavigationRail> createState() => CustomNavigationRailState();
}

class CustomNavigationRailState extends State<CustomNavigationRail> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  double groupAlignment = -1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: NavigationRail(
        selectedIndex: _selectedIndex,
        groupAlignment: groupAlignment,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelType: labelType,
        destinations: <NavigationRailDestination>[
          NavigationRailDestination(
              icon: const SizedBox(
                  width: 76,
                  height: 76,
                  child: Icon(
                    Icons.soup_kitchen,
                    size: 50,
                  )),
              label: textStyling('Ciorbe', customSize: 30)),
          NavigationRailDestination(
              icon: const SizedBox(
                  width: 76,
                  height: 76,
                  child: Icon(
                    Icons.cake_rounded,
                    size: 50,
                  )),
              label: textStyling('Prajituri', customSize: 30)),
          NavigationRailDestination(
              icon: const SizedBox(
                  width: 76,
                  height: 76,
                  child: Icon(
                    Icons.cake_outlined,
                    size: 50,
                  )),
              label: textStyling('Torturi', customSize: 30)),
        ],
      ),
    );
  }
}
