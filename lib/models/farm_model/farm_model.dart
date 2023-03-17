class FarmModels {
  final int pageIndex;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;
  final List<FarmValues> values;

  FarmModels(
      {required this.pageIndex,
      required this.totalPages,
      required this.totalCount,
      required this.hasPreviousPage,
      required this.hasNextPage,
      required this.values});

  factory FarmModels.fromJson(Map<String, dynamic> json) {
    return FarmModels(
      pageIndex: json['pageIndex'],
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
      hasPreviousPage: json['hasPreviousPage'],
      hasNextPage: json['hasNextPage'],
      values:
          (json['values'] as List).map((e) => FarmValues.fromJson(e)).toList(),
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

class FarmValues {
  final String? id;
  final int? count;
  final String? name;
  final String? image;
  final String? code;
  final String? address;

  FarmValues(
      this.id, this.name, this.image, this.code, this.count, this.address);

  FarmValues.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'].toString(),
        count = json['count'],
        code = json['code'],
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'count': count,
        'code': code,
        'address': address,
      };
}

class FarmPostModel {
  final String? sortProperty;
  final String? searchString;
  final String? mainPurpouse;
  final int? sortDirection;
  final int? pageSize;
  final int? pageNumber;

  FarmPostModel(
      {this.sortProperty,
      this.searchString,
      this.mainPurpouse,
      this.sortDirection,
      this.pageSize = 1000,
      this.pageNumber = 1});

  FarmPostModel.fromJson(Map<String, dynamic> json)
      : sortProperty = json['sortProperty'],
        searchString = json['searchString'],
        mainPurpouse = json['mainPurpouse'],
        sortDirection = json['sortDirection'],
        pageSize = json['pageSize'],
        pageNumber = json['pageNumber'];

  Map<String, dynamic> toJson() => {
        'sortProperty': sortProperty,
        'searchString': searchString,
        'sortDirection': sortDirection,
        'mainPurpouse': mainPurpouse,
        'pageSize': pageSize,
        'pageNumber': pageNumber,
      };
}
