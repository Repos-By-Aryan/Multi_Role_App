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
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration:InputDecoration(
                label: Text('Email'),
              ),
            ),
            (screenHeight*0.02).ph,
            InkWell(
              onTap: ()async{

              },
              child: Container(
                height:50,
                width: double.infinity,
                color:Colors.deepPurple.shade200,
                child: Center(child: Text("Click")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension Spacing on num{
  SizedBox get ph => SizedBox(height:toDouble(),);
  SizedBox get pw => SizedBox(width:toDouble(),);
}