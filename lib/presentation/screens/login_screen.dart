import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/assets_icons_path.dart';
import 'package:nectar_online_shop/core/validators/input_validators.dart';
import 'package:nectar_online_shop/data/api_services/api_response.dart';
import 'package:nectar_online_shop/data/get_storage/auth_storage.dart';
import 'package:nectar_online_shop/presentation/screens/main_nav_bar_holder_screen.dart';
import 'package:nectar_online_shop/presentation/screens/signup_screen.dart';
import 'package:nectar_online_shop/presentation/widgets/custom_text_button.dart';
import 'package:provider/provider.dart';
import '../../business/providers/login_provider.dart';
import '../widgets/screen_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    // final screenHeight = screenSize.height;
    // final screenWidth = screenSize.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //======================== Body Section =======================
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Consumer<LoginProvider>(
              builder: (context, login, child) {
                return Form(
                  key: login.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 28),
                      //------------------------ Carrot  Image -------
                      Center(child: Image.asset(AssetsIconsPath.orangeCarrot)),

                      SizedBox(height: 27),
                      //----------------- title --------------
                      Text("Login", style: textTheme.headlineMedium),
                      SizedBox(height: 15),
                      //----------------- sub-title --------------
                      Text(
                        "Enter your credentials to continue",
                        style: textTheme.titleSmall,
                      ),

                      //--------------- Email field Label -----------
                      SizedBox(height: 40),
                      Text("Email", style: textTheme.titleSmall),
                      SizedBox(height: 10),

                      TextFormField(
                        controller: login.emailController,
                        validator: InputValidators.emailValidator,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff181725),
                        ),
                        decoration: InputDecoration(
                          hintText: "example@gmail.com",
                        ),
                      ),

                      //--------------- Password field Label -----------
                      SizedBox(height: 30),
                      Text("Password", style: textTheme.titleSmall),
                      SizedBox(height: 10),

                      TextFormField(
                        validator: InputValidators.passwordValidator,
                        controller: login.passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: login.isPasswordHide,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff181725),
                        ),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: login.isPasswordVisibility,
                            child: Icon(
                              login.isPasswordHide
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),

                      //--------------- Forgot password Link -----------
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password",
                          style: textTheme.bodySmall!.copyWith(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      //----------------------- Login Button ---------
                      Center(
                        child: Visibility(
                          visible: login.inProgressIndicator == false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: CustomTextButton(
                            onPressed: () async {
                              if (await login.login()) {
                                //----------------- Snackbar -----------
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Login successful")),
                                );

                                //--------------- navigate to main navbar screen -----
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MainNavBarHolderScreen(),
                                  ),
                                  (predicate) => false,
                                );
                              } else {
                                return;
                              }
                            },
                            buttonName: "Log In",
                          ),
                        ),
                      ),

                      //---------------- Sign up link Row ------------
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-------------------- Text ------------
                          Text(
                            "Don't have an account?",
                            style: textTheme.bodySmall,
                          ),
                          SizedBox(width: 5),
                          //----------------- Link Text -------------
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                                (predicate) => false,
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: textTheme.bodySmall!.copyWith(
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),

                          //-------------------- space -----------
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
