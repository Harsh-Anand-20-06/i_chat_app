import 'package:flutter/material.dart';
import 'package:ichat_app/allConstants/color_constants.dart';
import 'package:ichat_app/allScreens/home_page.dart';
import 'package:ichat_app/allScreens/login_page.dart';
import 'package:ichat_app/allproviders/auth_provider.dart';
import 'package:provider/provider.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 5),(){
      checkSignedIn();
    });
  }

  void checkSignedIn() async{
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if(isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/splash.png",
              width: 300,
              height: 300,
              
            )
            ,const SizedBox(height: 20,),
            const Text(
              "Welcome to ichat_app",
              style: TextStyle(color: ColorConstants.themeColor),
            ),
            const SizedBox(height: 20,)
            ,const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: ColorConstants.themeColor,),
            )
          ],
        ),
      ),
    );
  }
}
