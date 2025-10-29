import 'package:flutter/material.dart';
import 'package:nectar_online_shop/business/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_icon_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
//----------------- init state -------
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      (context).read<ProductProvider>().fetchProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("My Cart"),
        centerTitle: true,
        elevation: 4,
      ),

      //================== body section ===============
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.cartList.isNotEmpty) {
                return ListView.separated(
                  itemCount: provider.cartList.length,
                  itemBuilder: (context, index) {
                    final product = provider.cartList[index];
                    return Row(
                      children: [
                        //------------- Product Image -------------
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Image.network(product.images[0]),
                          ),
                        ),

                        //-------------- title ---------------
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //----------- title -----------
                              Text(product.title),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  //------------- decrement Price -------------
                                  CustomIconButton(
                                    iconColor: Color(0xffE2E2E2),
                                    icons: Icons.remove,
                                    onTap: () =>
                                        provider.decrementPrice(product),
                                  ),
                                  SizedBox(width: 5),
                                  //----------- Quantity ---------
                                  Text(
                                    product.qnt.toString(),
                                    style: textTheme.titleSmall,
                                  ),
                                  //------------ increment price ------------
                                  SizedBox(width: 5),
                                  CustomIconButton(
                                    // color: Color(0xffE2E2E2),
                                    icons: Icons.add,
                                    onTap: () {
                                      provider.incrementPrice(product);
                                      print(product.qnt);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //-------------------- Price and Remove -----------
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              //---------------- remove icon -----------
                              IconButton(
                                onPressed: () =>
                                    provider.removeToCart(product.id),
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                icon: Icon(Icons.close, color: Colors.red),
                              ),

                              //---------------- Price -----------
                              Text(
                                "\$${product.totalPrice.toStringAsFixed(2)}",
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),

                        //-----------
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: Color(0xffE2E2E2));
                  },
                );
              } else {
                return Center(child: Text("No Product found !"));
              }
            },
          ),
        ),
      ),

      //================== Total Price Section ===========
      bottomNavigationBar: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 87,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Total Price : \$${provider.cartTotalPrice().toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
