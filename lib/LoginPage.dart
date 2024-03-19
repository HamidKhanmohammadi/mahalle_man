import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mahalle_man/LoginResponsModel.dart';
import 'package:mahalle_man/StoreMainMenuPage.dart';

import 'lang/faLang.dart';
import 'main.dart';

var lang = FaLang();
var fontFamily = FontFamily();

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[900],
        centerTitle: true,
        title: Text(
          "ورود",
          style: TextStyle(fontFamily: fontFamily.Sahelbold),
        ),
        leading: Icon(
          Icons.arrow_back,
        ),
      ),
      body: LoginUI(),
    );
  }

  Widget LoginUI() {
    return Builder(
      builder : (context) => Stack(
        children: [
         //Padding(
         //  padding: EdgeInsets.only(left: 20, top: 20),
         //  child: Text(
         //    "SignIn",
         //    style: TextStyle(
         //        fontFamily: fontFamily.Sahel, fontSize: 20, color: Colors.grey),
         //  ),
         //),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    child: TextField(
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: Color(
                              0xFF827717)),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: Color(0xFF71AD02)),
                        ),


                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        labelText: "نام کاربری",
                        labelStyle: TextStyle(
                          color: Colors.lime[900]
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.lime[500],
                          ),
                        ),

                      ),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: fontFamily.Sahel, fontSize: 20),
                      controller: usernameController,
                      cursorColor: Colors.lime[500],
                    ),
                    elevation: 3,
                    //borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.lime[200],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    child: TextField(
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: Color(
                              0xFF827717)),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: Color(0xFF71AD02)),
                        ),


                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        labelText: "رمز عبور",
                        labelStyle: TextStyle(
                            color: Colors.lime[900]
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.lock_outline,
                            color: Colors.lime[500],
                          ),
                        ),

                      ),
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontFamily: fontFamily.Sahel, fontSize: 20),
                      controller: passwordController,
                      cursorColor: Colors.lime[500],
                    ),
                    elevation: 3,
                    //borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.lime[200],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.lime[200],
                      child: InkWell(
                        onTap: () {
                          sendLoginRequest(context: context, username: usernameController.text, password: passwordController.text);
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "ورود",
                              style: TextStyle(
                                  fontFamily: fontFamily.Sahel, fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendLoginRequest ({@required BuildContext? context, @required String? username, @required String? password}) async{
    var url = Uri.parse("http://welearnacademy.ir/flutter/api/?type=login");
    var body = Map< String, dynamic>();
    body["username"] = username;
    body["password"] = password;
    Response response = await post(url,body: body);
    if(response.statusCode==200){
      var loginJson = json.decode(utf8.decode(response.bodyBytes));
      var model = LoginResponseModel(loginJson["result"], loginJson["message"]);
      if(model.result==0){

      showMySnackBar(context!, model.message );
      }else if (model.result==1){
        Navigator.of(context!).pushReplacement(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondAnimation) {
              return Store();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondAnimation,
                Widget child) {
              return ScaleTransition(
                child: child,
                scale:
                Tween<double>(begin: 0, end: 1)
                    .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn)),
              );
            }));
      }
    }else{
      showMySnackBar(context!, "درخواست با خطا مواجه گردید");
    }
  }

  void showMySnackBar(BuildContext context, String message){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontFamily: fontFamily.Sahel,
            fontSize: 10
          ),
        ),
      )
    );
  }
}
