import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:nectar_online_shop/core/constants/urls.dart';
import 'package:nectar_online_shop/data/api_services/api_services.dart';
import 'package:nectar_online_shop/data/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  Logger logger = Logger();

  //----------------------- Product List ---------------
  List<ProductModel> productList = [];

  //----------------------- Product List ---------------
  List<ProductModel> cartList = [];

  //------------- Product loading progress show ------------
  bool productLoadingProgress = false;

  //----------------- Total Price -------
  double totalPrice = 0;

  //===================== Fetch Product ====================
  Future fetchProduct() async {
    try {
      productLoadingProgress = true;
      notifyListeners();

      //------------- request sent -----------
      final response = await ApiServices.getData(Urls.productUrl);

      productLoadingProgress = false;
      notifyListeners();
      //------------ response check -----------
      if (response.statusCode == 200 && response.isSuccess) {
        final List<dynamic> data = response.responseBody["products"];
        productList = data.map((p) => ProductModel.fromJson(p)).toList();
        notifyListeners();
      }
    } catch (e) {
      logger.e("Product data fetch error : $e");
    }
  }

  //================== Add to Cart =========================
  void addToCart(ProductModel model) {
    if (alreadyCartAdded(model.id)) {
      return;
    }
    cartList.add(model);
    notifyListeners();
  }

  //================== Remove to Cart =========================
  void removeToCart(id) {
    cartList.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  //=============== AlreadyCartAdded ====================
  bool alreadyCartAdded(id) {
    return cartList.where((p) => p.id == id).isNotEmpty;
  }

  //================= Price Decrement ===================
  void incrementPrice(ProductModel model) {
    model.qnt++;
    model.totalPrice = model.price * model.qnt;
    notifyListeners();
  }

  //================= Price Decrement ===================
  void decrementPrice(ProductModel model) {
    if (model.qnt > 1) {
      model.qnt--;
      model.totalPrice = model.price * model.qnt;
      notifyListeners();
    }
  }

  //================ Cart total Price ================
  double cartTotalPrice() {
    double totalPrice = 0;
    for (var p in cartList) {
      totalPrice += p.totalPrice;
    }
    return totalPrice;
  }
}
