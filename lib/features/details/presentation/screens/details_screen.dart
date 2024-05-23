import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _animateContainer = false;
  double _imageHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animateContainer = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: 'realEstateImage',
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        _imageHeight = constraints.maxHeight;
                        return Image.network(
                          "https://images.pexels.com/photos/262405/pexels-photo-262405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
            Positioned(
              top: 10.0,
              left: 20.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 70.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Favorite action
                  },
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              right: 20.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Share action
                  },
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              top: _animateContainer ? _imageHeight - 20.0 : MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height - (_imageHeight - 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text("Premium Elite Modern Hpuse"),
                    Text("Soekerno- Hatta Stree , jomaba es Java")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
