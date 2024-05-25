import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/home/domain/entities/real_estate_entity.dart';

class ItemRealEstate extends StatelessWidget {
  final List<String> labels = ["SALE", "FLATS", "NEW CONSTRUCTION"];
  final VoidCallback onTap;
  final RealEstateEntity realEstateEntity;


  ItemRealEstate({super.key, required this.onTap,required this.realEstateEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: Hero(
                    tag: realEstateEntity.images.first.id,
                    child: Image.network(
                      width: double.infinity,
                      height: 170,
                      realEstateEntity.images.first.url,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: labels.map((label) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD79B4C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          label,
                          style: GoogleFonts.ptSans(
                            fontSize: 10, // Smaller font size
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20, // Adjust the radius as needed
                    child: IconButton(
                      onPressed: () {
                        // Your onPressed function here
                      },
                      icon: Icon(Icons.bookmark_border),
                      color: Colors.black, // Adjust the icon color as needed
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    realEstateEntity.title,
                    style: GoogleFonts.ptSans(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_sharp, color: Colors.black26),
                      Text(
                        realEstateEntity.subTitle,
                        style: GoogleFonts.ptSans(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.bed, color: Colors.grey),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "4",
                            style: GoogleFonts.ptSans(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Beds",
                            style: GoogleFonts.ptSans(
                                fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.bathtub_outlined, color: Colors.grey),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "4",
                            style: GoogleFonts.ptSans(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Bath",
                            style: GoogleFonts.ptSans(
                                fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.local_parking, color: Colors.grey),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "4",
                            style: GoogleFonts.ptSans(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Parking",
                            style: GoogleFonts.ptSans(
                                fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
