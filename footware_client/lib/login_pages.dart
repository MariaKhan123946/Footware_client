import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
     width: double.maxFinite,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Back!',style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),),
            SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Mobile Number',
                hintText: 'Enter your mobile number',

              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,

                ),


             child:Text('Login') ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){

            }, child: Text('Reister new account',))

          ],
        ),

      )
    );
  }
}
