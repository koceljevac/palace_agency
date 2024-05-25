import '../../domain/entities/real_estate_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({
    required int id,
    required String title,
    required String url,
    required int realEstateId,
  }) : super(id: id, title: title, url: url, realEstateId: realEstateId);

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      realEstateId: json['realEstateId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'realEstateId': realEstateId,
    };
  }
}
