class InfoModel {
  final int pageIndex;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;
  final List<Values> values;

  InfoModel(
      {required this.pageIndex,
      required this.totalPages,
      required this.totalCount,
      required this.hasPreviousPage,
      required this.hasNextPage,
      required this.values});

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      pageIndex: json['pageIndex'],
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
      hasPreviousPage: json['hasPreviousPage'],
      hasNextPage: json['hasNextPage'],
      values: (json['values'] as List).map((e) => Values.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'pageIndex': pageIndex,
        'totalPages': totalPages,
        'totalCount': totalCount,
        'hasPreviousPage': hasPreviousPage,
        'hasNextPage': hasNextPage,
        'values': values,
      };
}

class Values {
  final int id;
  final String title;
  final String description;
  final String bannerImageUrl;

  Values(this.id, this.title, this.description, this.bannerImageUrl);

  Values.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        bannerImageUrl = json['bannerImageUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'bannerImageUrl': bannerImageUrl,
      };
}
