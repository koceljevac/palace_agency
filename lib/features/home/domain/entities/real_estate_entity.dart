import 'package:equatable/equatable.dart';

class RealEstateEntity extends Equatable {
  final int id;
  final String title;
  final String slug;
  final String subTitle;
  final String description;
  final int price;
  final String type;
  final String listingType;
  final int squareFootage;
  final int constructionYear;
  final int renovationYear;
  final int numberOfRooms;
  final List<ImageEntity> images;

  const RealEstateEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.subTitle,
    required this.description,
    required this.price,
    required this.type,
    required this.listingType,
    required this.squareFootage,
    required this.constructionYear,
    required this.renovationYear,
    required this.numberOfRooms,
    required this.images,
  });

  @override
  List<Object> get props => [
    id,
    title,
    slug,
    subTitle,
    description,
    price,
    type,
    listingType,
    squareFootage,
    constructionYear,
    renovationYear,
    numberOfRooms,
    images,
  ];
}

class ImageEntity extends Equatable {
  final int id;
  final String title;
  final String url;
  final int realEstateId;

  const ImageEntity({
    required this.id,
    required this.title,
    required this.url,
    required this.realEstateId,
  });

  @override
  List<Object> get props => [id, title, url, realEstateId];
}
