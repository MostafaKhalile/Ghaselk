class OrderModel {
  String address;
  String day;
  String time;
  int totalPrice;
  int driverPrice;
  int longitude;
  int latitude;
  int laundryId;
  List<Products> products;

  OrderModel(
      {this.address,
        this.day,
        this.time,
        this.totalPrice,
        this.driverPrice,
        this.longitude,
        this.latitude,
        this.laundryId,
        this.products});

  OrderModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    day = json['day'];
    time = json['time'];
    totalPrice = json['total_price'];
    driverPrice = json['driver_price'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    laundryId = json['laundry_id'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['day'] = this.day;
    data['time'] = this.time;
    data['total_price'] = this.totalPrice;
    data['driver_price'] = this.driverPrice;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['laundry_id'] = this.laundryId;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String quantity;
  String productId;

  Products({this.quantity, this.productId});

  Products.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['product_id'] = this.productId;
    return data;
  }
}
