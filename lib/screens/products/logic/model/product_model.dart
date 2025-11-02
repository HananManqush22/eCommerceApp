class ProductModel {
  String? productId;
  String? createdAt;
  String? productName;
  String? price;
  String? oldPrice;
  String? sale;
  String? category;
  String? description;
  String? imageUrl;
  List<FavoriteTable>? favoriteTable;
  List<PurchaseTable>? purchaseTable;

  ProductModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.price,
    this.oldPrice,
    this.sale,
    this.category,
    this.description,
    this.imageUrl,
    this.favoriteTable,
    this.purchaseTable,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    createdAt = json['created_at'];
    productName = json['product_name'];
    price = json['price'];
    oldPrice = json['old_price'];
    sale = json['sale'];
    category = json['category'];
    description = json['description'];
    imageUrl = json['image_url'];
    if (json['favorite_table'] != null) {
      favoriteTable = <FavoriteTable>[];
      json['favorite_table'].forEach((v) {
        favoriteTable!.add(FavoriteTable.fromJson(v));
      });
    }
    if (json['purchase_table'] != null) {
      purchaseTable = <PurchaseTable>[];
      json['purchase_table'].forEach((v) {
        purchaseTable!.add(PurchaseTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['product_name'] = productName;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['sale'] = sale;
    data['category'] = category;
    data['description'] = description;
    data['image_url'] = imageUrl;
    if (favoriteTable != null) {
      data['favorite_table'] = favoriteTable!.map((v) => v.toJson()).toList();
    }
    if (purchaseTable != null) {
      data['purchase_table'] = purchaseTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteTable {
  String? forUser;
  String? createdAt;
  String? favoriteId;
  String? forProduct;
  bool? isFavorite;

  FavoriteTable({
    this.forUser,
    this.createdAt,
    this.favoriteId,
    this.forProduct,
    this.isFavorite,
  });

  FavoriteTable.fromJson(Map<String, dynamic> json) {
    forUser = json['for_user'];
    createdAt = json['created_at'];
    favoriteId = json['favorite_id'];
    forProduct = json['for_product'];
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['for_user'] = forUser;
    data['created_at'] = createdAt;
    data['favorite_id'] = favoriteId;
    data['for_product'] = forProduct;
    data['is_favorite'] = isFavorite;
    return data;
  }
}

class PurchaseTable {
  String? forUser;
  bool? isBought;
  String? createdAt;
  String? forProduct;
  String? purchaseId;

  PurchaseTable({
    this.forUser,
    this.isBought,
    this.createdAt,
    this.forProduct,
    this.purchaseId,
  });

  PurchaseTable.fromJson(Map<String, dynamic> json) {
    forUser = json['for_user'];
    isBought = json['is_bought'];
    createdAt = json['created_at'];
    forProduct = json['for_product'];
    purchaseId = json['purchase_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['for_user'] = forUser;
    data['is_bought'] = isBought;
    data['created_at'] = createdAt;
    data['for_product'] = forProduct;
    data['purchase_id'] = purchaseId;
    return data;
  }
}
