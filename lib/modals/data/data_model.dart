class DataModel {
  dynamic title;
  dynamic location;
  dynamic companyName;
  dynamic description;
  dynamic qualifications;
  dynamic responsibilities;
  dynamic benefits;
  dynamic thumbnail;
  dynamic extensions;
  dynamic via;
  dynamic id;
  dynamic url;

  DataModel({
    required this.title,
    required this.location,
    required this.benefits,
    required this.companyName,
    required this.description,
    required this.qualifications,
    required this.responsibilities,
    required this.via,
    required this.extensions,
    required this.thumbnail,
    required this.id,
    required this.url,
  });

  factory DataModel.fromJson(dynamic response) {
    final data = response;
    final List<dynamic> highlights =
        response["job_highlights"] as List<dynamic>;

    return DataModel(
      title: data["title"],
      location: data["location"],
      benefits: highlights.length > 2
          ? highlights[2]["items"]
          : ['Good work life balance'],
      companyName: data["company_name"],
      description: data["description"],
      qualifications: highlights.isNotEmpty ? highlights[0]["items"] : '',
      responsibilities: highlights.length > 1
          ? highlights[1]["items"]
          : ['Lead a team of developers'],
      via: data["via"],
      extensions: data["extensions"],
      id: data["job_id"],
      url: data["related_links"][0]["link"],
      thumbnail: data["thumbnail"] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYbC-cHTjuJ9UaREYgxWnkQSaJLfyY3PPK9Zl3A1Q&s',
    );
  }

  DataModel.empty();
}
