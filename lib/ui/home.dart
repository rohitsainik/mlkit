import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlkit/ui/objectdetec.dart';
import 'package:mlkit/ui/textrecog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("good"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset("images/mlkit.png"),
            SizedBox(height: 20.0,),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => TextRecognisation()));
                    },
                    icon: Icon(Icons.text_fields),
                    label: Text("Text Recognisation")),
                RaisedButton.icon(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> objectDetection()));},
                    icon: Icon(Icons.local_activity),
                    label: Text("Object Detection")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
