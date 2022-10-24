import 'dart:io';
import 'package:e_comearce/widget/custom_Button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCorses extends StatefulWidget {
  const AddNewCorses({Key? key}) : super(key: key);

  @override
  State<AddNewCorses> createState() => _AddNewCorsesState();
}

class _AddNewCorsesState extends State<AddNewCorses> {
  final _titleControler = TextEditingController();
  final _descriptionControler = TextEditingController();
  XFile? _courseImage;
  String? imageURL;
  choseImagefromGalary() async {
    final ImagePicker picker = ImagePicker();
    _courseImage= await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
// writeData()async{
//   File imageFile=File(_courseImage!.path);
//     FirebaseStorage _storege=FirebaseStorage.instance;
//    UploadTask uploadeTask= _storege.ref("images").child(_courseImage!.name).putFile(imageFile);
// TaskSnapshot snapshot =await uploadeTask;
// imageURL=await snapshot.ref.getDownloadURL();
// print(imageURL);
// }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: _titleControler,
              decoration: const InputDecoration(
                hintText: "Enter your title",
              ),
            ),
            TextField(
              controller: _descriptionControler,
              decoration: const InputDecoration(
                hintText: "Enter your title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                  child: Center(
                    child: Material(
                        child: _courseImage==null?IconButton(
                          onPressed: () => choseImagefromGalary(),
                          icon: Icon(Icons.photo),
                        ):Image.file(File(_courseImage!.path),fit: BoxFit.cover,)
                    ),
                  ),
                )
            ),
            CustomButton(
                text: Text("continue"),
                onprest: (){}
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
