class RecentBooksModel {
  final String? status;
  final int? total;
  final List<Books>? books;

  RecentBooksModel({
    this.status,
    this.total,
    this.books,
  });

  RecentBooksModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        total = json['total'] as int?,
        books = (json['books'] as List?)
            ?.map((dynamic e) => Books.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'total': total,
        'books': books?.map((e) => e.toJson()).toList()
      };
}

class Books {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? authors;
  final String? image;
  final String? url;

  Books({
    this.id,
    this.title,
    this.description,
    this.subtitle,
    this.authors,
    this.image,
    this.url,
  });

  Books.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        subtitle = json['subtitle'] as String?,
        authors = json['authors'] as String?,
        image = json['image'] as String?,
        description = json['description'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'description' : description,
        'authors': authors,
        'image': image,
        'url': url,
      };
}
