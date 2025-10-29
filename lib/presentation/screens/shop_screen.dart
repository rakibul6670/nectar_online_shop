import 'package:flutter/material.dart';
import 'package:nectar_online_shop/business/providers/product_provider.dart';
import 'package:nectar_online_shop/presentation/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

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
    return Scaffold(

      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            SizedBox(height: 20,),
            //=========================== Exclusive Offer Section ===============
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context,provider,child) {
                  if(provider.productLoadingProgress){
                    return Center(child: CircularProgressIndicator(color: Colors.blue,));
                  }
                  else if(provider.productList.isNotEmpty){
                    return GridView.builder(
                      itemCount: provider.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = provider.productList[index];
                        return ProductCard(product: product, provider: provider,);
                      },
                    );
                  }
                  else{
                   return Center(child: Text("No Product found !"));
                  }
                }
              ),
            )

          ],
        ),
      )),
    );
  }
}
