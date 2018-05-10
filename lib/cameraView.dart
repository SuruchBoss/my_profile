import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'dart:convert'; 

class UploadAvatarButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeUploadAvatarButtonState();
  }
}


class MakeUploadAvatarButtonState extends State<UploadAvatarButton> {
  File _image;
  
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;

  //     List<int> imageBytes = image.readAsBytesSync();
  //     String base64Image = BASE64.encode(imageBytes);

  //     Navigator.push(context, new MaterialPageRoute(builder: (_) => 
  // new MyApp(_image.)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker Example'),
      ),
      body: new Center(
        child: _image == null
            ? new Text('No image selected.')
            : new Image.file(_image),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}
