import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
              },
              child: Container(
                height:50,
                width: double.infinity,
                color:Colors.deepPurple.shade50,
                child: Center(child: Text("Click")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
