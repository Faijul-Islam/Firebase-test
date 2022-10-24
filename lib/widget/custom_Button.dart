import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key,required this.text,required this.onprest}) : super(key: key);
Widget text;
VoidCallback onprest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
            width: 300,
            child: ElevatedButton(onPressed: onprest, child: text,
              style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),),)
      ],
    );
  }
}
