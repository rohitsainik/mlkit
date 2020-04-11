
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

class TextRecognisation extends StatefulWidget {
  @override
  _TextRecognisationState createState() => _TextRecognisationState();
}

class _TextRecognisationState extends State<TextRecognisation> {
  File _image;
  String _text = "text";

  Future getImagecamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
  Future getImagegallary() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future readtext() async{
    FirebaseVisionImage ourimage = FirebaseVisionImage.fromFile(_image);
    TextRecognizer ourtext = FirebaseVision.instance.textRecognizer();
    VisionText readText = await ourtext.processImage(ourimage);

    setState(() {
      for(TextBlock block in readText.blocks){

          _text = (block.text);

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Recognisation"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                _image == null
                    ? Placeholder()
                    : Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(_image), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton.icon(
                        onPressed: () {getImagegallary();},
                        icon: Icon(Icons.camera),
                        label: Text("Image from Gallary")),
                    RaisedButton.icon(
                        onPressed: () {getImagecamera();},
                        icon: Icon(Icons.camera_alt),
                        label: Text("Image from Camera")),
                  ],

                ),
                Center(
                  child: RaisedButton.icon(
                      onPressed: () {readtext();},
                      icon: Icon(Icons.title),
                      label: Text("Start Recognization")),
                ),
                Center(
                  child: Text(_text),
                )
              ],
            ),
          ],

        ),
      ),
    );
  }
}
