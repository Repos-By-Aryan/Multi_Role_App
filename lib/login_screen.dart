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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('name', 'Aryan');
                sp.setInt('age', 20);


                debugPrint(sp.getString('name'));
                debugPrint(sp.getInt('age').toString());
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
