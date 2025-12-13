//Source Api

class SourceModel{

  String category;
  String country;
  String description;
  String id;
  String language;
  String name;
  String url;

  SourceModel({
    required this.category,
    required this.country,
    required this.description,
    required this.id,
    required this.language,
    required this.name,
    required this.url,
});

  factory SourceModel.fromJson(Map<String, dynamic> json){
    return SourceModel(
      category:json['category'],
      country:json['country'],
      description:json['description'],
      id:json['id'],
      language:json['language'],
      name:json['name'],
      url:json['url'],
    );
  }

}

class SourceDataModel {
  String status;
  List<SourceModel> sources;

  SourceDataModel({
    required this.status,
    required this.sources,
  });

  factory SourceDataModel.fromJson(Map<String, dynamic> json){

    List<SourceModel> getSources = [];

    for(Map<String, dynamic> eachSource in json['sources']){
      getSources.add(SourceModel.fromJson(eachSource));
    }

    return SourceDataModel(
      status:json['status'],
      sources:json['sources'],
    );
  }
}






