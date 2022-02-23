import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HeroImages {
  static const List<String> titles = [
    'Bear',
    'Tiger',
    'Hedgehog',
    'Turtle',
    'Dolphin',
    'Butterfly',
    'Rose',
    'Sunflower',
    'Rabbit',
    'Dogs',
    'HeighMountain',
    'Lake',
  ];

  static const List<String> urls = [
    'https://images.pexels.com/photos/65289/polar-bear-bear-teddy-sleep-65289.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/145939/pexels-photo-145939.jpeg?cs=srgb&dl=pexels-flickr-145939.jpg&fm=jpg',
    'https://images.pexels.com/photos/847393/pexels-photo-847393.jpeg?cs=srgb&dl=pexels-belle-co-847393.jpg&fm=jpg',
    'https://images.pexels.com/photos/50577/hedgehog-animal-baby-cute-50577.jpeg?cs=srgb&dl=pexels-pixabay-50577.jpg&fm=jpg',
    'https://images.pexels.com/photos/64219/dolphin-marine-mammals-water-sea-64219.jpeg?cs=srgb&dl=pexels-pixabay-64219.jpg&fm=jpg',
    'https://images.pexels.com/photos/672142/pexels-photo-672142.jpeg?cs=srgb&dl=pexels-zaw-win-tun-672142.jpg&fm=jpg',
    'https://images.pexels.com/photos/39517/rose-flower-blossom-bloom-39517.jpeg?cs=srgb&dl=pexels-pixabay-39517.jpg&fm=jpg',
    'https://images.pexels.com/photos/46216/sunflower-flowers-bright-yellow-46216.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/372166/pexels-photo-372166.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1612371/pexels-photo-1612371.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/2286895/pexels-photo-2286895.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ];
}

class ImageItem extends StatelessWidget {
  ImageItem({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Container(
        color: Colors.grey[200],
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      fit: BoxFit.cover,
    );
  }
}

class HeroFromPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: [
          for (var index = 0; index < HeroImages.titles.length; index++)
            Hero(
              tag: HeroImages.titles[index],
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HeroToPage(
                        index: index,
                      ),
                    ),
                  );
                },
                child: ImageItem(
                  url: HeroImages.urls[index],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class HeroToPage extends StatelessWidget {
  HeroToPage({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(HeroImages.titles[index]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Hero(
            tag: HeroImages.titles[index],
            child: Center(
              child: ImageItem(url: HeroImages.urls[index]),
            ),
          ),
        ),
      ),
    );
  }
}
