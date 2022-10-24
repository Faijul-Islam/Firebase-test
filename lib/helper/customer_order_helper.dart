import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import '../customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerOrderList {
  Future<List<Comments>?> getCustomer() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if(response.statusCode==200){
      var json=response.body;
      return commentsFromJson(json);
    }
    return null;
  }
}
