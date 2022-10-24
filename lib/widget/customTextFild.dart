import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
   CustomTextFild({Key? key,required this.hintext,required this.icon }) : super(key: key);
  String hintext;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            decoration: InputDecoration(
              hintText: hintext,

              prefixIcon: IconTheme(
                data: IconThemeData(color:  Colors.black),
                child: icon,
              ),
              prefixIconColor:  Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),

      ],
    );
  }
}
