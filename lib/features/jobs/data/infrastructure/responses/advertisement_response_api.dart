import 'package:flutter_application_1/features/jobs/data/models/models.dart';


class AdvertisementResponseApi {
  String message;
  List<AdvertisementModel> data;

  AdvertisementResponseApi({required this.message, required this.data});

  factory AdvertisementResponseApi.fromJson(Map<String, dynamic> json) {
    return AdvertisementResponseApi(
      message: json["message"],
      data: List<AdvertisementModel>.from(
          json["data"].map((x) => AdvertisementModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}