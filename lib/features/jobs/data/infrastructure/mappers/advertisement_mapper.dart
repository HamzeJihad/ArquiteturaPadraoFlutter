
import 'package:flutter_application_1/features/jobs/data/models/models.dart';

import '../../../domain/entities/entities.dart';

class AdvertisementMapper {
  static AdvertisementJobEntity advertisementModelToEntity(
    AdvertisementModel advertisementModel,
  ) {
    return AdvertisementJobEntity(
      id: advertisementModel.id,
      jobTitle: advertisementModel.jobTitle,
      description: advertisementModel.description,
      companyName: advertisementModel.companyName,
      location: advertisementModel.location,
      salaryRange: advertisementModel.salaryRange,
      currency: advertisementModel.currency,
      level: advertisementModel.level,
      contractType: advertisementModel.contractType,
      category: advertisementModel.category,
      contact: advertisementModel.contact,
      contactType: advertisementModel.contactType,
      tags: advertisementModel.tags,
    );
  }
}
