
import 'package:flutter/material.dart';
import 'package:nectar_online_shop/data/get_storage/auth_storage.dart';

import '../screens/login_screen.dart';


logoutDialog(BuildContext context){
  // final Size screenSize = MediaQuery.of(context).size;
  // final screenHeight = screenSize.height;
  // final screenWidth = screenSize.width;
  final textTheme = Theme.of(context).textTheme;
  return showDialog(context: context, useSafeArea: true,barrierDismissible: false, builder:(context){
    return Center(
      child: AlertDialog(

        elevation: 4,
        title: Icon(Icons.logout,color: Colors.red,size: 30,),
        contentPadding: EdgeInsets.all(10),
        content: Text("Are you sure to logout ?",style: textTheme.titleMedium!.copyWith(
          color: Colors.black,
        ),),
        actionsAlignment: MainAxisAlignment.spaceBetween,

        actions: [
          //-------------- No Button ----------
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("No")),

          //-------------- Yes Button ----------
          TextButton(onPressed: () {
            AuthStorage.clearUserData();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                   LoginScreen(),
              ),
                  (predicate) => false,
            );

          }, child: Text("Yes")),
        ],

        //-----


      ),
    );
  });
}