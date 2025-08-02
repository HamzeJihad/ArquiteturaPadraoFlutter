import 'package:flutter_application_1/features/jobs/data/models/models.dart';

class DetailsAdvertisementResponseApi {
  AdvertisementModel data;

  DetailsAdvertisementResponseApi({required this.data});

  factory DetailsAdvertisementResponseApi.fromJson(Map<String, dynamic> json) {
    return DetailsAdvertisementResponseApi(
      data: AdvertisementModel.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return  data.toJson();
  }
}
