import 'package:flutter/material.dart';
import 'package:flutterapp/Register.dart';
import 'package:flutterapp/HelloMe.dart';
class MyHomePage extends StatefulWidget
{
  @override
 Home createState () => Home();

}
class Home extends State<MyHomePage> {


  final controller = TextEditingController();
  String user = "huyen";
  String pass = "12345";
  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: Colors.white,
        body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0, bottom: 50.0),
                child: new Image.asset("images/preview-286598-AU60az2v1.jpg",
                width: 100.0, height: 100.0,
                )),
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
              //can deu trai phai, tren duoi
              child: new TextField(
                controller: _user,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "your@gmail.com"
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                child: new TextField(
                    controller: _pass,

                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password"

                    ))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                child: new SizedBox(
                  width: 260.0,
                child: new RaisedButton(
                    child: Text("LOGIN"),
                    onPressed: ()
                  {

                    setState(() {
                      if(_user.text==user && _pass.text == pass)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelloMe()),
                        );}
                        else {
                           showDialog(
                             context: context,
                             builder: (_){
                               return AlertDialog(
                                 title: Text("Sai"),
                                 actions: <Widget>[
                                   FlatButton(
                                      child: new Text( "close"),
                                       onPressed: (){
                                        Navigator.of(context).pop();
                                   },
                                   )],
                               );
                             }
                          );
                      }
                    });
                  },
                ))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: new Text("Forget your password ?",style: TextStyle(fontSize: 13))
                      ),

            Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                child: RaisedButton(
                color:  const Color(0xFF8EB1F0),
                child: Text("Login with Facebook"),
                onPressed: (){}
            ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0, bottom: 20.0),
              child: new MaterialButton(

                  child: new Text("Don't have an account ? Create one",
                      style: TextStyle(
                          fontSize: 13,fontWeight: FontWeight.bold )),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      }
              ))
          ],
        ));
  }


}