import 'package:flutter/material.dart';
import 'package:multi_role_chapter_9/admin_screen.dart';
import 'package:multi_role_chapter_9/getters.dart';
import 'package:multi_role_chapter_9/home_screen.dart';
import 'package:multi_role_chapter_9/student_screen.dart';
import 'package:multi_role_chapter_9/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String dropdownValue='';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text('Email'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter email';
                  }
                  return null;
                },
              ),
              (screenHeight * 0.02).ph, //SizedBox Extension
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Password'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter password';
                  }
                  return null;
                },
              ),
              (screenHeight * 0.02).ph,
              DropdownButtonFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Select User Type';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'User Type',
                ),
                items: <String>['Admin','Teacher','Student']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },),
              (screenHeight * 0.02).ph, //SizedBox Extension
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  if (_formKey.currentState!.validate()) {
                  sp.setString('email', emailController.text.toString());
                  sp.setString('password', passwordController.text.toString());
                  //admin, student, teacher
                  sp.setString('userType',dropdownValue.toString());
                  sp.setBool('isLogin', true);
                  String userType = sp.getString('userType')!;
                  if(userType == 'Student'){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentScreen(),),);
                  }
                  else if(userType=='Admin'){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminScreen(),),);
                  }
                  else if(userType =='Teacher'){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeacherScreen(),),);
                  }
                  else{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
                  }}
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.deepPurple.shade100,
                  child: Center(child: Text("Login")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
