import 'dart:math';

class ProductModel {
  final int id;
  final String title;
  final String body;
  late  double price;
  late double totalPrice;
  final List<dynamic> images;
   int qnt;


  //===================== Constructor =======================
  ProductModel({
    required this.id,
    required this.title,
    required this.body,
    required this.images,
    // required this.userId,
    required this.price,
    this.qnt = 1,
    double? tPrice,
  }){
    //---------- constructor body value assign ---------
    totalPrice = tPrice?? price;
  }

  //=================== Factory Constructor ================

  factory ProductModel.fromJson(Map<String, dynamic> json) {

    final random = Random();
    double randomPrice = 10 + random.nextInt(90) + random.nextDouble();
    return ProductModel(
      id: json["id"],
      title: json["title"],
      body: json["description"],
      price: randomPrice,
      images: json["images"],
    );
  }
}
