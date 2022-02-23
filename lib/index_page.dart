import 'package:flutter/material.dart';
import 'package:nyumon/sliver_app_bar_page.dart';

import 'container_properties_page.dart';
import 'grid_view_page.dart';
import 'sliver_app_bar_page.dart';
import 'responsive_design_page.dart';
import 'shrinkable_footer_page.dart';

import 'hero_page.dart';
import 'transition_page.dart';
import 'open_container_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const ContainerPropertiesPage();
                  }),
                );
              },
              child: const Text('ContainerPropertiesPage'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return GridViewPage();
                  }),
                );
              },
              child: const Text('GridViewPage'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return SliverAppBarPage();
                  }),
                );
              },
              child: const Text('SliverAppBarPage'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ShrinkableFooterPage();
                  }),
                );
              },
              child: const Text('ShrinkableFooterPage'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ResponsiveDesignPage();
                  }),
                );
              },
              child: const Text('ResponsiveDesignPage'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return HeroFromPage();
                  }),
                );
              },
              child: const Text('Hero'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TransitionPage();
                  }),
                );
              },
              child: const Text('Transition'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return OpenContainerPage();
                  }),
                );
              },
              child: const Text('OpenContainer'),
            ),
          ),
        ],
      ),
    );
  }
}
