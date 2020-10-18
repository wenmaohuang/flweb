import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class HeadImageUploadPage extends StatefulWidget {
  @override
  _HeadImageUploadPageState createState() => _HeadImageUploadPageState();
}

class _HeadImageUploadPageState extends State<HeadImageUploadPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _upLoadImage(image);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _upLoadImage(File _imageDir) async {
    // String path = image.path;
    var fileDir=_imageDir.path;

    var name = fileDir.substring(fileDir.lastIndexOf("/") + 1, fileDir.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    // FormData formData = new FormData.from({
    //   "userId": "10000024",
    //   "file": new UploadFileInfo(new File(path), name,
    //       contentType: ContentType.parse("image/$suffix"))
    // });


    FormData formData = FormData.fromMap({
      "name": "zhangsna 6666666666",
      "age": 20,
      "sex": "男",
      "file":  await MultipartFile.fromFile(fileDir, filename: "xxx.jpg")
    });




    Dio dio = new Dio();
    var respone = await dio.post<String>("/upload", data: formData);
    if (respone.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "图片上传成功",
          gravity: ToastGravity.CENTER,
          textColor: Colors.grey);
    }
  }
}