class HistoryModels {
  final int pageIndex;
  final int totalPages;
  final int totalCount;
  final bool hasPreviousPage;
  final bool hasNextPage;
  final List<HistoryValues> values;

  HistoryModels(
      {required this.pageIndex,
      required this.totalPages,
      required this.totalCount,
      required this.hasPreviousPage,
      required this.hasNextPage,
      required this.values});

  factory HistoryModels.fromJson(Map<String, dynamic> json) {
    return HistoryModels(
      pageIndex: json['pageIndex'],
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
      hasPreviousPage: json['hasPreviousPage'],
      hasNextPage: json['hasNextPage'],
      values: (json['values'] as List)
          .map((e) => HistoryValues.fromJson(e))
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

class HistoryValues {
  final String? lotId;
  final String? lotName;
  final String? auctionName;
  final String? livestockId;
  final String? livestockImage;
  final int? lastStatus;
  final DateTime? time;

  HistoryValues(this.lotName, this.auctionName, this.livestockId, this.lotId,
      this.livestockImage, this.lastStatus, this.time);

  HistoryValues.fromJson(Map<String, dynamic> json)
      : lotName = json['lotName'],
        auctionName = json['auctionName'],
        lotId = json['lotId'],
        livestockId = json['livestockId'],
        livestockImage = json['livestockImage'],
        lastStatus = json['lastStatus'],
        time = DateTime.parse(json["time"]);

  Map<String, dynamic> toJson() => {
        'lotName': lotName,
        'auctionName': auctionName,
        'lotId': lotId,
        'livestockId': livestockId,
        'livestockImage': livestockImage,
        'lastStatus': lastStatus,
        'time': time?.toIso8601String(),
      };
}

class HistoryDeteailed {
  final String? liveStockId;
  final String? image;
  final int? finalAmount;
  final List<HistoryDeteailedHistory> history;

  HistoryDeteailed(
      this.liveStockId, this.image, this.history, this.finalAmount);

  HistoryDeteailed.fromJson(Map<String, dynamic> json)
      : liveStockId = json['liveStockId'],
        image = json['image'],
        finalAmount = json['finalAmount'],
        history = (json['history'] as List)
            .map((e) => HistoryDeteailedHistory.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'liveStockId': liveStockId,
        'image': image,
        'finalAmount': finalAmount,
        'history': history,
      };
}

class HistoryDeteailedHistory {
  final String? description;
  final int? type;
  final DateTime? time;

  HistoryDeteailedHistory(this.description, this.type, this.time);

  HistoryDeteailedHistory.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        type = json['type'],
        time = DateTime.parse(json["time"]);

  Map<String, dynamic> toJson() => {
        'description': description,
        'type': type,
        'time': time?.toIso8601String(),
      };
}
