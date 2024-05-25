import 'image_model.dart';
import '../../domain/entities/real_estate_entity.dart';

class RealEstateModel extends RealEstateEntity {
  RealEstateModel({
    required int id,
    required String title,
    required String slug,
    required String subTitle,
    required String description,
    required int price,
    required String type,
    required String listingType,
    required int squareFootage,
    required int constructionYear,
    required int renovationYear,
    required int numberOfRooms,
    required List<ImageModel> images,
  }) : super(
    id: id,
    title: title,
    slug: slug,
    subTitle: subTitle,
    description: description,
    price: price,
    type: type,
    listingType: listingType,
    squareFootage: squareFootage,
    constructionYear: constructionYear,
    renovationYear: renovationYear,
    numberOfRooms: numberOfRooms,
    images: images,
  );

  factory RealEstateModel.fromJson(Map<String, dynamic> json) {
    return RealEstateModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      subTitle: json['subTitle'],
      description: json['description'],
      price: json['price'],
      type: json['type'],
      listingType: json['listingType'],
      squareFootage: json['squareFootage'],
      constructionYear: json['constructionYear'],
      renovationYear: json['renovationYear'],
      numberOfRooms: json['numberOfRooms'],
      images: (json['images'] as List).map((i) => ImageModel.fromJson(i)).toList(),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'slug': slug,
  //     'subTitle': subTitle,
  //     'description': description,
  //     'price': price,
  //     'type': type,
  //     'listingType': listingType,
  //     'squareFootage': squareFootage,
  //     'constructionYear': constructionYear,
  //     'renovationYear': renovationYear,
  //     'numberOfRooms': numberOfRooms,
  //     'images': images.map((i) => i.toJson()).toList(),
  //   };
  // }
}
