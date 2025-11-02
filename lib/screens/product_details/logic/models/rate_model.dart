class RateModel {
  String? rateId;
  String? createdAt;
  int? rate;
  String? forUser;
  String? forProduct;

  RateModel({
    this.rateId,
    this.createdAt,
    this.rate,
    this.forUser,
    this.forProduct,
  });

  RateModel.fromJson(Map<String, dynamic> json) {
    rateId = json['rate_id'];
    createdAt = json['created_at'];
    rate = json['rate'];
    forUser = json['for_user'];
    forProduct = json['for_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['rate_id'] = rateId;
    data['created_at'] = createdAt;
    data['rate'] = rate;
    data['for_user'] = forUser;
    data['for_product'] = forProduct;
    return data;
  }
}
