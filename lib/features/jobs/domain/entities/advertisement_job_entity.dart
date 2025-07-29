class AdvertisementJobEntity {
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

    AdvertisementJobEntity({
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

}
