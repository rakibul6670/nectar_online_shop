import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/assets_icons_path.dart';
import 'package:nectar_online_shop/core/validators/input_validators.dart';
import 'package:nectar_online_shop/presentation/widgets/custom_text_button.dart';
import 'package:provider/provider.dart';
import '../../business/providers/signup_provider.dart';
import '../widgets/screen_background.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final Size screenSize = MediaQuery.of(context).size;
    // final screenHeight = screenSize.height;
    // final screenWidth = screenSize.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(

      //======================== Body Section =======================
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Consumer<SignupProvider>(
              builder: (context,signup,child) {
                return Form(
                  key: signup.signupFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 28),
                      //------------------------ Carrot  Image -------
                      Center(child: Image.asset(AssetsIconsPath.orangeCarrot)),

                      SizedBox(height: 27),
                      //----------------- title --------------
                      Text("Sign Up", style: textTheme.headlineMedium),
                      SizedBox(height: 15),
                      //----------------- sub-title --------------
                      Text(
                        "Enter your credentials to continue",
                        style: textTheme.titleSmall,
                      ),

                      //--------------- Username field Label -----------
                      SizedBox(height: 40),
                      Text("Username", style: textTheme.titleSmall),
                      SizedBox(height: 10),

                      TextFormField(
                        controller: signup.userNameController,
                        validator: InputValidators.nameValidator,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff181725),
                        ),
                        decoration: InputDecoration(hintText: "rakibul"),
                      ),

                      //--------------- Email field Label -----------
                      SizedBox(height: 20),
                      Text("Email", style: textTheme.titleSmall),
                      SizedBox(height: 10),

                      TextFormField(
                        controller: signup.emailController,
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
                      SizedBox(height: 20),
                      Text("Password", style: textTheme.titleSmall),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: InputValidators.passwordValidator,
                        controller: signup.passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: signup.isPasswordHide,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff181725),
                        ),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: signup.isPasswordVisibility,
                              child: Icon(signup.isPasswordHide? Icons.visibility_off:  Icons.visibility)),
                        ),
                      ),

                      //--------------- Term and Condition Text-----------------
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: "By continuing you agree to our ",
                          style: textTheme.bodySmall,

                          children: [
                            TextSpan(
                              text: " Terms of Service",
                              style: textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            TextSpan(text: " and ", style: textTheme.bodySmall),
                            TextSpan(
                              text: " Privacy Policy.",
                              style: textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),
                      //----------------------- Login Button ------------------
                      Center(
                        child: Visibility(
                          visible: signup.inProgressIndicator == false,
                          replacement: Center(child: CircularProgressIndicator(color: Colors.blue,)),
                          child: CustomTextButton(
                            onPressed: () async{
                              if(await signup.signup(context)){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()),
                                        (predicate)=> false);
                              }
                              else {
                                return ;
                              }
                            },
                            buttonName: "Sign Up",
                          ),
                        ),
                      ),

                      //---------------- Sign up link Row ------------
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-------------------- Text ------------
                          Text("Already have an account?",style: textTheme.bodySmall,),
                          SizedBox(width: 5),
                          //----------------- Link Text -------------
                          GestureDetector(
                            child: Text("Login",style: textTheme.bodySmall!.copyWith(
                              color: Colors.deepPurpleAccent
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
