import 'package:e_comearce/customer_model.dart';
import 'package:e_comearce/vewse/bottomPayges/addnewcorses.dart';
import 'package:e_comearce/vewse/bottomPayges/body_data.dart';
import 'package:e_comearce/widget/Common_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/customer_order_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  addNewcorses(context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.blueGrey,
        context: context,
        builder: (_) => const AddNewCorses());
  }

  List<Comments>? comment;
  bool isloded = false;
  getData() async {
    comment = await CustomerOrderList().getCustomer();
    setState(() {
      isloded = true;
    });
    if(comment==null){
      return const CircularProgressIndicator();
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Courses"),
        actions: [
          IconButton(
              onPressed: () => addNewcorses(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Visibility(
        visible: isloded,
        child: ListView.builder(
            itemCount: comment?.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>
                      BodyData(
                          name: comment![index].name,
                          email: comment![index].email,
                          body:comment![index].body,
                          id: comment![index].id,
                          userId: comment![index].postId
                      )));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(6.w, 4.h, 6.w, 4.h),
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonCardData(
                        title: "Email :",
                        value: comment![index].email,
                      ),
                      CommonCardData(
                          title: "Name :", value: comment![index].name),
                      CommonCardData(
                          title: "id :", value: comment![index].id.toString()),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
