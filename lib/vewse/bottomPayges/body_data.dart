import 'package:flutter/material.dart';

import '../../widget/Common_Card.dart';

class BodyData extends StatelessWidget {
  BodyData(
      {Key? key,
      required this.name,
      required this.email,
      required this.body,
      required this.id,
      required this.userId})
      : super(key: key);
  String name, body, email;
  int id, userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CommonCardData(
                  title: "Email :",
                  value:email,
                ),
                CommonCardData(
                    title: "Name :", value:name),
                CommonCardData(
                    title: "Body :", value:body,

                ),
                CommonCardData(
                    title: "id :", value:id.toString()),
                CommonCardData(
                    title: "PostId :",
                    value: userId.toString()),
              ],
            ),
          ),
        ),
    );
  }
}
