import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final List<List<QuiltedGridTile>> predefinedPatterns = [
    [QuiltedGridTile(2, 2), QuiltedGridTile(1, 1), QuiltedGridTile(1, 1), QuiltedGridTile(1, 2)],
    [QuiltedGridTile(1, 2), QuiltedGridTile(1, 1), QuiltedGridTile(2, 2), QuiltedGridTile(1, 1)],
    [QuiltedGridTile(1, 1), QuiltedGridTile(2, 2), QuiltedGridTile(1, 1), QuiltedGridTile(1, 2)],
    [QuiltedGridTile(1, 1), QuiltedGridTile(1, 2), QuiltedGridTile(2, 2), QuiltedGridTile(1, 1)],
    [QuiltedGridTile(2, 2), QuiltedGridTile(1, 2), QuiltedGridTile(1, 1), QuiltedGridTile(1, 1)],
    [QuiltedGridTile(1, 1), QuiltedGridTile(1, 2), QuiltedGridTile(1, 1), QuiltedGridTile(2, 2)],
    [QuiltedGridTile(1, 2), QuiltedGridTile(2, 2), QuiltedGridTile(1, 1), QuiltedGridTile(1, 1)],
    [QuiltedGridTile(1, 1), QuiltedGridTile(1, 2), QuiltedGridTile(2, 2), QuiltedGridTile(1, 1)],
    [QuiltedGridTile(2, 2), QuiltedGridTile(1, 1), QuiltedGridTile(1, 2), QuiltedGridTile(1, 1)],
    [QuiltedGridTile(1, 1), QuiltedGridTile(1, 2), QuiltedGridTile(1, 1), QuiltedGridTile(2, 2)],
  ];

  List<QuiltedGridTile> _generatePattern(int index) {
    return predefinedPatterns[index % predefinedPatterns.length];
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = 20; // Example item count
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double tileHeight = screenHeight / 5;
    double tileWidth = screenWidth / 2;

    return Scaffold(
      body: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(20),
        minScale: 0.5,
        maxScale: 4.0,
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: _generatePattern(0), // Initial pattern
          ),
          childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/slika${index + 1}.jpg',
                    fit: BoxFit.cover,
                    height: tileHeight,
                    width: tileWidth,
                  ),
                ),
              );
            },
            childCount: itemCount,
          ),
        ),
      ),
    );
  }
}