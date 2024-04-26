class CartModel {
  int? itemTotalPrice;
  int? countItems;
  int? cartId;
  int? cartUsersId;
  int? cartItemsId;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  String? itemsImage;
  int? itemsCat;

  CartModel(
      {this.itemTotalPrice,
      this.countItems,
      this.cartId,
      this.cartUsersId,
      this.cartItemsId,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsImage,
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemTotalPrice = json['total_price'];
    countItems = json['count_items'];
    cartId = json['cart_id'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsImage = json['items_image'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_price'] = itemTotalPrice;
    data['count_items'] = countItems;
    data['cart_id'] = cartId;
    data['cart_users_id'] = cartUsersId;
    data['cart_items_id'] = cartItemsId;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_image'] = itemsImage;
    data['items_cat'] = itemsCat;
    return data;
  }
}