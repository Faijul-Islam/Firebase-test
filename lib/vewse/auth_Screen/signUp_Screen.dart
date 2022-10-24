import 'package:e_comearce/vewse/auth_Screen/signin_Screen.dart';
import 'package:e_comearce/widget/customTextFild.dart';
import 'package:e_comearce/widget/custom_Button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                  text:Text("SignUp"),
                  onprest: (){
                    print("tap");
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SignInScreen()));
                  }
              ),
              ElevatedButton(
                onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (_)=>SignInScreen()));}, child: Text("SignUp"),)
            ],
          ),
        ),
      ),
    );
  }
}