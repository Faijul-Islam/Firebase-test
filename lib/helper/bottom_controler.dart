import 'package:get/get.dart';

class BottomControler extends GetxController{
  var selecteditem=0.obs;
  get currentindex =>selecteditem;
  void changeIndex(int index){
    selecteditem.value=index;
  }
}