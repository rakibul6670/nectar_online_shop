import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/assets_images_path.dart';
import 'package:nectar_online_shop/data/get_storage/auth_storage.dart';
import 'package:nectar_online_shop/presentation/dialog/logout_dialog.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future loadUser() async {
    await AuthStorage.getUserData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Color(0xff517DA2),
      //==================== Body Section =========================
      body: SafeArea(
        child: Column(
          children: [
            //=================== Profile section ===============
            Visibility(
              visible: isLoading == false,
              replacement: Center(
                child: CircularProgressIndicator(color: Colors.blue),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: screenSize.height * .40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsImagesPath.accountBg),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25),
                    //---------------------- title and pop up menu ----------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profile",
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            logoutDialog(context);
                          },
                          child: Icon(Icons.exit_to_app, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    //-------------------- profile image --------------
                    CircleAvatar(radius: 70, backgroundColor: Colors.blue),
                    SizedBox(height: 10),
                    //--------------------- User Name ---------------
                    Text(
                      "${AuthStorage.accessModel?.name}",
                      style: textTheme.titleMedium,
                    ),
                    SizedBox(height: 10),
                    //--------------------- User Email  ---------------
                    Text(
                      "${AuthStorage.accessModel?.email}",
                      style: textTheme.titleSmall!.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //------------------ title ---------
                      Text(
                        "Account Overview",
                        style: textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 15),
                      //------------- My Profile ----------
                      ListTile(
                        //---------- icon -
                        leading: Icon(
                          Icons.person_outline_outlined,
                          color: Colors.blue,
                          size: 25,
                        ),
                        //-------- title -------
                        title: Text('My Profile'),
                        //----------- foreword icon ---
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 25,
                        ),
                      ),
                      SizedBox(height: 15),

                      //------------- Change Password ----------
                      ListTile(
                        //---------- icon -
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.amber,
                          size: 25,
                        ),
                        //-------- title -------
                        title: Text('Change Password'),
                        //-------- foreword icon --------
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 25,
                        ),
                      ),

                      SizedBox(height: 15),
                      //------------- Change Language ----------
                      ListTile(
                        //---------- icon -
                        leading: Icon(
                          Icons.language,
                          color: Colors.purple,
                          size: 25,
                        ),
                        //-------- title -------
                        title: Text('Change Language'),
                        //-------- foreword icon --------
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 25,
                        ),
                      ),

                      SizedBox(height: 15),
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
