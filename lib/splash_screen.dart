
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:multi_role_chapter_9/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
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