import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahalle_man/Products.dart';
import 'package:mahalle_man/shoppingBasketDeta.dart';
import 'lang/faLang.dart';


var lang = new FaLang();
var fontFamily = new FontFamily();

class DescriptionPage extends StatelessWidget {
  //const DescriptionPage({Key? key}) : super(key: key);

  late Products _products;
  DescriptionPage(this._products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[900],
        centerTitle: true,
        title: Text(
          lang.appName,
          style: TextStyle(fontFamily: fontFamily.Sahelbold),
        ),
        leading: Icon(
          Icons.arrow_back,
        ),
      ),

      endDrawer: Drawer(
        child: ListView(
          children: [
            Divider(),
            ListTile(
              title: Text("ورود", textDirection: TextDirection.rtl,),
              trailing: Icon(Icons.login),
            ),
            Divider(),
          ],
        ),
      ),
      body: Builder(
        builder:(context) => Column(

          children: [
            Center(
              child: SizedBox(
                height: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Align(
                child: Text(
                  "جزئیات کفش",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: fontFamily.Sahel,
                    color: Colors.red[700]
                  ),
                ),
                alignment: Alignment.topRight,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.network(
                _products.imageUrl,
                width: 250,
                height: 250,
              ),
            ),
            Text(
              _products.productName,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
                fontFamily: fontFamily.Sahel
              ),
            ),
            Text(
              _products.price,
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 20,
                  fontFamily: fontFamily.Sahel
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 45,right: 45),
              child: Text(_products.description,
                style:TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                    fontFamily: fontFamily.Sahel
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Align(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      print("print ${_products.productName}");
                      ShoppingBasketDeta.getInstance()!.basketItems!.add(_products);
                      print("${ShoppingBasketDeta.getInstance()!.basketItems!.length}");
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${_products.productName} به سبد خرید شما افزوده شد",
                            style: TextStyle(
                              fontFamily: fontFamily.Sahel,
                              fontSize: 10
                            ),
                          ),
                        )
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(
                        child: Text("افزودن به سبد خرید",
                          style: TextStyle(
                            fontFamily: fontFamily.Sahel,
                            fontSize: 16,
                            color: Colors.white70
                          ),

                        ),
                      ),
                      width: MediaQuery.of(context).size.width-50,
                      height: 50,
                    ),
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
