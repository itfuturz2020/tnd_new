class SaveDataClass {
  String Message;
  bool IsSuccess;
  String Data;

  SaveDataClass({this.Message, this.IsSuccess, this.Data});
}

class OfferClassData {
  String Message;
  bool IsSuccess;
  List<OfferClass> Data;

  OfferClassData({
    this.Message,
    this.IsSuccess,
    this.Data,
  });

  factory OfferClassData.fromJson(Map<String, dynamic> json) {
    return OfferClassData(
        Message: json['Message'] as String,
        IsSuccess: json['IsSuccess'] as bool,
        Data: json['Data']
            .map<OfferClass>((singleJson) => OfferClass.fromJson(singleJson))
            .toList());
  }
}

class OfferClass {
  String offerId;
  String offerName;

  OfferClass({this.offerId, this.offerName});

  factory OfferClass.fromJson(Map<String, dynamic> json) {
    return OfferClass(
        offerId: json['_id'] as String,
        offerName: json['categoryName'] as String);
  }
}

class MemberCategoryData {
  String Message;
  bool IsSuccess;
  List<CategoryData> Data;

  MemberCategoryData({
    this.Message,
    this.IsSuccess,
    this.Data,
  });

  factory MemberCategoryData.fromJson(Map<String, dynamic> json) {
    return MemberCategoryData(
        Message: json['Message'] as String,
        IsSuccess: json['IsSuccess'] as bool,
        Data: json['Data']
            .map<CategoryData>(
                (singleJson) => CategoryData.fromJson(singleJson))
            .toList());
  }
}

class CategoryData {
  String Id;
  String memberShipName;

  CategoryData({this.Id, this.memberShipName});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
        Id: json['_id'] as String,
        memberShipName: json['memberShipName'] as String);
  }
}
