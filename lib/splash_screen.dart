
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:multi_role_chapter_9/home_screen.dart';
import 'package:multi_role_chapter_9/login_screen.dart';
import 'package:multi_role_chapter_9/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType')?? '';
    // ? after datatype ensures that the value can be null
    //! at the end will check that the value using get method will never be null
    Timer(Duration(seconds: 4), () {
      if(isLogin){
        if(userType == 'student'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentScreen(),),);
        }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
      }}
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CachedNetworkImage(
      height: screenHeight,
      fit: BoxFit.fitHeight,
      imageUrl: "https://images.pexels.com/photos/8451450/pexels-photo-8451450.jpeg?cs=tinysrgb&w=1260&h=750&dpr=1",
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(
            child: Container(
              height: 50,
                width: 50,
                child: CircularProgressIndicator(value: downloadProgress.progress)),
          ),
      errorWidget: (context, url, error) => Icon(Icons.error),
        ),
    );
  }
}