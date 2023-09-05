import 'package:flutter/material.dart';
import 'package:multi_role_chapter_9/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:InputDecoration(
                label: Text('Email'),
              ),
            ),
            (screenHeight*0.02).ph,//SizedBox Extension
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration:InputDecoration(
                label: Text('Password'),
              ),
            ),
            (screenHeight*0.02).ph,//SizedBox Extension
            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                // sp.setString('password', passwordController.text.toString());
                sp.setBool('isLogin', true);
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                height:50,
                width: double.infinity,
                color:Colors.deepPurple.shade200,
                child: Center(child: Text("Login")),
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