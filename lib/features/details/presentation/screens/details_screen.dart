import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palace_agency/features/home/domain/entities/real_estate_entity.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatefulWidget {
  final RealEstateEntity realEstateEntity;

  DetailsScreen({required this.realEstateEntity, Key? key}) : super(key: key);

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
    void _showFullScreenImage(BuildContext context, String imageUrl) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Container(
              color: Colors.black,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: InteractiveViewer(
                    child: Image.network(imageUrl),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: widget.realEstateEntity.images.first.id,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        _imageHeight = constraints.maxHeight;
                        return GestureDetector(
                          onTap: () {
                            _showFullScreenImage(
                              context,
                              widget.realEstateEntity.images.first.url,
                            );
                          },
                          child: PageView(
                            children: widget.realEstateEntity.images
                                .map((image) => Image.network(
                              image.url,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ))
                                .toList(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
            Positioned(
              top: 10.0,
              left: 20.0,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.6),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
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
                backgroundColor: Colors.white.withOpacity(0.6),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
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
                backgroundColor: Colors.white.withOpacity(0.6),
                child: IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Share action
                  },
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              top: _animateContainer
                  ? _imageHeight - 20.0
                  : MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              child: Container(
                height:
                MediaQuery.of(context).size.height - (_imageHeight - 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.realEstateEntity.title,
                          style: GoogleFonts.ptSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff232323)),
                        ),
                        Text(
                          widget.realEstateEntity.slug,
                          style: GoogleFonts.ptSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xff9f9f9f)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0x38dedede),
                              borderRadius: BorderRadius.circular(25)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.bed_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("4"),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Beds"),
                                Spacer(),
                                Icon(Icons.bathtub_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("2"),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Bath"),
                                Spacer(),
                                Icon(Icons.local_parking_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("4"),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Parking"),
                                Spacer(),
                                Icon(Icons.square_outlined),
                                SizedBox(
                                  width: 2,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("3260ft"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Description",
                          style: GoogleFonts.ptSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff232323)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(
                          widget.realEstateEntity.description,
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          colorClickableText: Colors.blueAccent,
                          trimCollapsedText: 'See More',
                          trimExpandedText: 'See less',
                          style: GoogleFonts.ptSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff3f3f3f)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(width: 1, color: Colors.black12),
                          ),
                          height: 70,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/avatar_circle.jpg'),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Andrea Ilić",
                                          style: GoogleFonts.ptSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff232323)),
                                        ),
                                        Text(
                                          "Agentica",
                                          style: GoogleFonts.ptSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff232323)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                      Colors.blueAccent.withOpacity(0.4),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.call,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor:
                                      Colors.blueAccent.withOpacity(0.4),
                                      child: IconButton(
                                        icon: const Icon(Icons.message,
                                            color: Colors.white),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Text("Soekerno- Hatta Stree , jomaba es Java"),
                        Text("Premium Elite Modern Hpuse"),
                        Text("Soekerno- Hatta Stree , jomaba es Java"),
                        SizedBox(
                          height: 300,
                        ),
                        Text("Soekerno- Hatta Stree , jomaba es Java"),
                        SizedBox(
                          height: 500,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
