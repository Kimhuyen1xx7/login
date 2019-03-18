import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Register extends StatefulWidget
{
  @override
  Home2 createState () => Home2();
  final rightSection = new Container();
  final facebook = new Container();

}

class Home2 extends State<Register>
{
  File _image;
  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void _openCamera() async {
    File picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _image = picture;
    });
  }

  void _openGallery() async {
    File gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = gallery;
    });
  }
  Widget _home()
  {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Register", textAlign: TextAlign.center,),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.check),
              onPressed: () => Navigator.of(context).pop(null))
        ],
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }
  Widget _body()
  {
    return new Container(

      child: Column(
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.all(10.0),
              color: const Color(0xFFFFFFFF),
              height: 360.0,
              width: 360.0,

              child: new Column(
                children: <Widget>[
                          new Row(
                          children: <Widget>[
                            new Stack(
                                alignment: const Alignment(0.6, 0.6),
                                children: [
                                  _image == null
                                      ? new CircleAvatar(backgroundImage: AssetImage('images/addimage.jpg'),radius: 30.0,)
                                      : new CircleAvatar(
                                    backgroundImage: new FileImage(_image), radius: 30.0,),
                                  Container(
                                      child: Opacity(
                                          opacity: 0.0,
                                          child: new RaisedButton(
                                            onPressed: ()
                                            => _optionsDialogBox(),
                                            child: new Icon(Icons.add_a_photo),

                                          )
                                      )
                                  )
                                ]
                            ),
                              rightSection,
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30.0),
                            color: const Color(0xFFDCDCDC),
                            height: 1.0,
                            width: 180.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: new Column(
                              children: <Widget>[
                                  new  TextField(
                                  decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        hintText: "Email"
                                      ),
                                    ),
                                  new  TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.credit_card),
                                        hintText: "Name"
                                    ),
                                  ),
                                  new  TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.phone),
                                        hintText: "Phone"
                                    ),
                                  ),
                                  new  TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.location_on),
                                        hintText: "Location"
                                    ),
                                  ),
                              ]))
                        ],),
         ),
          new Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top:30.0),
                        color: const Color(0xFFDCDCDC),
                        width: 200.0,
                        height: 1.0,
                      ),
                        facebook,
                      ])),
          ],
        ),
      );
  }

  final rightSection = new Expanded(
      child: new Container(
              padding: EdgeInsets.only(left: 40.0, right: 30.0, top: 5.0),
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                   new TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Username"
                      )
                  ),

                    new TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",

                      ))
            ])));
  final facebook = new Container(
    padding: EdgeInsets.only(top: 10.0),
          child: RaisedButton(
              color:  const Color(0xFF8EB1F0),
              child: Text("Login with Facebook"),
              onPressed: (){}
  ));
  Future<void> _optionsDialogBox() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: _openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: _openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _home();
  }

}