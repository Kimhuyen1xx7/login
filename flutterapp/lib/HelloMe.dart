import 'package:flutter/material.dart';



class HelloMe extends StatefulWidget{
  @override
  Hello createState  () => Hello();
}
class Hello extends State<HelloMe>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Image.asset("images/hinh-nen-dien-thoai-dep-nhat-full-hd-cho-dien-thoai-iphone-android-31.jpg",),

          ],
        ),
      ),
    ));
  }

}
