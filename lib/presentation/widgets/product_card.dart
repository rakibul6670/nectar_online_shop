import 'package:flutter/material.dart';
import 'package:nectar_online_shop/business/providers/product_provider.dart';
import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductProvider provider;
  final ProductModel product;
  final double? height;

  const ProductCard({
    super.key,
    required this.product,
    this.height,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      height: height ?? 248,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xffffffff),
        border: Border.all(color: Color(0xffE9E9E9)),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //----------------- Product image --------------------
          Expanded(flex: 4, child: Image.network(product.images[0])),

          //---------------
          Expanded(
            flex: 3,
            child: Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //----------------- Product Price -----------
                Text(
                  "\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                // SizedBox(height: 10,),

                //---------------- price and Cart  add ------------
                Container(
                  height: 35, // 45,
                  width: 35, //45,
                  decoration: BoxDecoration(
                    color: Color(0xff53B175),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      provider.addToCart(product);
                    },
                    child: provider.alreadyCartAdded(product.id)
                        ? Icon(Icons.remove, color: Colors.white)
                        : Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
