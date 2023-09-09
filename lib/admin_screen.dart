import 'package:flutter/material.dart';
import 'package:multi_role_chapter_9/getters.dart';
import 'package:multi_role_chapter_9/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String email="", password = "",userType = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email')!;
    password = sp.getString('password')!;
    userType = sp.getString('userType')??'';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin View"),
          centerTitle: true,
          elevation: 10,
        ),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("UserType : "),
                  Text(userType.toString()),
                ],),
              (screenHeight*0.02).ph,Row(
                children: [
                  Text("Email : "),
                  Text(email.toString()),
                ],),
              (screenHeight*0.02).ph,//SizedBox Extension
              Row(
                children: [
                  Text("Password : "),
                  Text(password.toString()),
                ],
              ),
              (screenHeight*0.02).ph,
              InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  height:50,
                  width: double.infinity,
                  color:Colors.deepPurple.shade100,
                  child: Center(child: Text("Logout")),
                ),
              ),
            ],
          ),
        )
    );
  }
}
