import 'package:flutter/material.dart';

import '../../widget/customTextFild.dart';
import '../../widget/custom_Button.dart';
import '../bottomPayges/bottomNavScreen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset("assets/login.gif",fit: BoxFit.cover,),
              ),
              SizedBox(height: 20,),
              CustomTextFild(
                  hintext: "hintext",
                  icon: Icon(Icons.email)
              ),
              SizedBox(height: 20,),
              CustomTextFild(
                  hintext: "hintext",
                  icon: Icon(Icons.email)
              ),
              SizedBox(height: 20,),
              CustomButton(
                  text:Text("SignIn"),
                  onprest: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavScreen()));}
              )
            ],
          ),
        ),
      ),
    );
  }
}
