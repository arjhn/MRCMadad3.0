class ModelNewsData{

  String? title;
  String? description;
  int? dateNews;
  String? author;
  String? language;
  String? url;
  String? dateString;
  String? imageURL;
  String? publisher;

  ModelNewsData({
    this.title,
    this.description,
    this.dateNews,
    this.author,
    this.language,
    this.url,
    this.dateString,
    this.imageURL,
    this.publisher
  });

  factory ModelNewsData.fromJson(Map<String,dynamic> json){
    return ModelNewsData(
        title: json['title'] as String?,
        description: json['description'] as String?,
        dateNews: json['date'] as int?,
        author: json['author'] as String?,
        language: json['language'] as String?,
        url: json['url'] as String?,
        dateString: json['dateString'] as String?,
        imageURL: json['image'] as String?,
        publisher: json['publisher'] as String?
    );
  }

  Map<String,dynamic> toJson()=>{
    'title':title,
    'description':description,
    'dateNews':dateNews,
    'author':author,
    'language':language,
    'url':url,
    'dateString':dateString,
    'imageURL':imageURL,
    'publisher':publisher
  };

}