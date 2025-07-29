class AdvertisementModel {
  String id;
  String companyName;
  String jobTitle;
  int salaryRange;
  String currency;
  String location;
  String description;
  String level;
  String contractType;
  String category;
  String contact;
  String contactType;
  List<String> tags;

  AdvertisementModel({
    required this.id,
    required this.companyName,
    required this.jobTitle,
    required this.salaryRange,
    required this.currency,
    required this.location,
    required this.description,
    required this.level,
    required this.contractType,
    required this.category,
    required this.contact,
    required this.contactType,
    required this.tags,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => AdvertisementModel(
    id: json["id"],
    companyName: json["companyName"],
    jobTitle: json["jobTitle"],
    salaryRange: json["salaryRange"],
    currency: json["currency"],
    location: json["location"],
    description: json["description"],
    level: json["level"],
    contractType: json["contractType"],
    category: json["category"],
    contact: json["contact"],
    contactType: json["contactType"],
    tags: List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyName": companyName,
    "jobTitle": jobTitle,
    "salaryRange": salaryRange,
    "currency": currency,
    "location": location,
    "description": description,
    "level": level,
    "contractType": contractType,
    "category": category,
    "contact": contact,
    "contactType": contactType,
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}
