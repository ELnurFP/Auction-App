class LiveStockModels {
  final int? pageIndex;
  final int? totalPages;
  final int? totalCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;
  final List<LiveStockValues?> values;

  LiveStockModels(
      {required this.pageIndex,
      required this.totalPages,
      required this.totalCount,
      required this.hasPreviousPage,
      required this.hasNextPage,
      required this.values});

  factory LiveStockModels.fromJson(Map<String, dynamic> json) {
    return LiveStockModels(
      pageIndex: json['pageIndex'],
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
      hasPreviousPage: json['hasPreviousPage'],
      hasNextPage: json['hasNextPage'],
      values: (json['values'] as List)
          .map((e) => LiveStockValues.fromJson(e))
          .toList(),
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

class LiveStockValues {
  final String? id;
  final int? sex;
  final String? breedName;
  final String? breedType;
  final String? imageUrl;
  final String? name;

  LiveStockValues(this.id, this.breedName, this.breedType, this.imageUrl,
      this.sex, this.name);

  LiveStockValues.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        breedName = json['breedName'],
        breedType = json['breedType'],
        sex = json['sex'],
        name = json['name'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'breedName': breedName,
        'breedType': breedType,
        'sex': sex,
        'name': name,
        'imageUrl': imageUrl,
      };
}

class LiveStockDetailed {
  final String? id;
  final int? age;
  final String? name;
  final String? birthDay;
  final int? sex;
  final int? weight;
  final String? description;
  final String? breedName;
  final String? breedType;
  final String? owner;
  final String? country;
  final int? milkYieald;
  final List<dynamic> vactinations;
  final List<dynamic> images;

  LiveStockDetailed(
      this.id,
      this.weight,
      this.age,
      this.birthDay,
      this.description,
      this.breedName,
      this.sex,
      this.name,
      this.breedType,
      this.country,
      this.milkYieald,
      this.vactinations,
      this.images,
      this.owner);

  LiveStockDetailed.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        birthDay = json['birthDay'],
        age = json['age'],
        weight = json['weight'],
        description = json['description'],
        sex = json['sex'],
        name = json['name'],
        breedType = json['breedType'],
        owner = json['owner'],
        country = json['country'],
        vactinations = json['vactinations'],
        images = json['images'],
        milkYieald = json['milkYieald'],
        breedName = json['breedName'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'birthDay': birthDay,
        'age': age,
        'weight': weight,
        'description': description,
        'sex': sex,
        'name': name,
        'breedType': breedType,
        'breedName': breedName,
        'owner': owner,
        'milkYieald': milkYieald,
        'vactinations': vactinations,
        'images': images,
        'country': country,
      };
}
