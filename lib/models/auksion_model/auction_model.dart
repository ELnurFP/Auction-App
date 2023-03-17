class AuctionModels {
  final int pageIndex;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;
  final List<AuctionValues> values;

  AuctionModels(
      {required this.pageIndex,
      required this.totalPages,
      required this.totalCount,
      required this.hasPreviousPage,
      required this.hasNextPage,
      required this.values});

  factory AuctionModels.fromJson(Map<String, dynamic> json) {
    return AuctionModels(
      pageIndex: json['pageIndex'],
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
      hasPreviousPage: json['hasPreviousPage'],
      hasNextPage: json['hasNextPage'],
      values: (json['values'] as List)
          .map((e) => AuctionValues.fromJson(e))
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

class AuctionValues {
  final String? id;
  final String? name;
  final String? imageUrl;
  final DateTime? startTime;
  final String? address;

  AuctionValues(
      this.id, this.name, this.imageUrl, this.startTime, this.address);

  AuctionValues.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'].toString(),
        startTime = DateTime.parse(json["startTime"]),
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'startTime': startTime!.toIso8601String(),
        'address': address,
      };
}

class AuctionLotModel {
  final List<Lots> lots;
  AuctionLotModel({
    required this.lots,
  });
  factory AuctionLotModel.fromJson(Map<String, dynamic> json) {
    return AuctionLotModel(
      lots: (json['lots'] as List).map((e) => Lots.fromJson(e)).toList(),
    );
  }
  Map<String, dynamic> toJson() => {
        'lots': lots,
      };
}

class Lots {
  final String livestockId;
  final String imageUrl;
  final String name;
  final String startPrice;
  Lots({
    required this.livestockId,
    required this.imageUrl,
    required this.name,
    required this.startPrice,
  });
  factory Lots.fromJson(Map<String, dynamic> json) {
    return Lots(
      livestockId: json['livestockId'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      startPrice: json['startPrice'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'livestockId': livestockId,
        'imageUrl': imageUrl,
        'name': name,
        'startPrice': startPrice,
      };
}

class StartAuctionModel {
  final int? state;
  final String? message;
  final String? token;
  final DateTime? startDate;

  StartAuctionModel(this.state, this.message, this.token, this.startDate);

  StartAuctionModel.fromJson(Map<String, dynamic> json)
      : state = json['state'],
        message = json['message'],
        token = json['token'],
        startDate = DateTime.parse(json["startDate"]);

  Map<String, dynamic> toJson() => {
        'state': state,
        'message': message,
        'token': token,
        'startDate': startDate!.toIso8601String(),
      };
}

class CurrentLotModel {
  final String livestockId;
  final String id;
  final String name;
  final String startPrice;
  CurrentLotModel({
    required this.livestockId,
    required this.id,
    required this.name,
    required this.startPrice,
  });
  factory CurrentLotModel.fromJson(Map<String, dynamic> json) {
    return CurrentLotModel(
      livestockId: json['livestockId'],
      id: json['id'],
      name: json['name'],
      startPrice: json['startPrice'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'livestockId': livestockId,
        'imageUrl': id,
        'name': name,
        'startPrice': startPrice,
      };
}
