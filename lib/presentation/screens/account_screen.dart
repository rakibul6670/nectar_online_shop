import 'package:flutter/material.dart';
import 'package:nectar_online_shop/data/get_storage/auth_storage.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    AuthStorage.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.amber,
      //==================== Body Section =========================
      body: SafeArea(
        child: Column(
          children: [
            //=================== Profile section ===============
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: screenSize.height * .40,
              decoration: BoxDecoration(color: Colors.amber),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //---------------------- title and pop up menu ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Profile"),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  //-------------------- profile image --------------
                  CircleAvatar(radius: 27, backgroundColor: Colors.blue),

                  //--------------------- User Name ---------------
                  Text("${AuthStorage.accessModel?.name}"),

                  //--------------------- User Email  ---------------
                  Text("${AuthStorage.accessModel?.email}"),
                ],
              ),
            ),

            //===================== Profile item section ===============
            Expanded(
              child: Container(
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //------------------ title ---------
                      Text("Account Overview"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
