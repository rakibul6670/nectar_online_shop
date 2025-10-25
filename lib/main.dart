import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nectar_online_shop/app.dart';

void main() async {
  await GetStorage.init();

  runApp(NectarOnlineShop());
}
