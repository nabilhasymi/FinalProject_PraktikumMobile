class DetailedBooksModel {
  DetailedBooksModel({
    required this.status,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.authors,
    required this.publisher,
    required this.pages,
    required this.year,
    required this.image,
    required this.url,
    required this.download,
  });
  late final String status;
  late final String id;
  late final String title;
  late final String subtitle;
  late final String description;
  late final String authors;
  late final String publisher;
  late final String pages;
  late final String year;
  late final String image;
  late final String url;
  late final String download;
  
  DetailedBooksModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    authors = json['authors'];
    publisher = json['publisher'];
    pages = json['pages'];
    year = json['year'];
    image = json['image'];
    url = json['url'];
    download = json['download'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['id'] = id;
    _data['title'] = title;
    _data['subtitle'] = subtitle;
    _data['description'] = description;
    _data['authors'] = authors;
    _data['publisher'] = publisher;
    _data['pages'] = pages;
    _data['year'] = year;
    _data['image'] = image;
    _data['url'] = url;
    _data['download'] = download;
    return _data;
  }
}