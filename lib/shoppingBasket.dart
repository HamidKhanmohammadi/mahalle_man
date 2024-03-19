import 'package:flutter/material.dart';
import 'package:mahalle_man/ShoppngBasketItem.dart';
import 'package:mahalle_man/shoppingBasketDeta.dart';
import 'lang/faLang.dart';

var lang = FaLang();
var fontFamily = FontFamily();

class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[900],
        centerTitle: true,
        title: Text(
          "سبد خرید",
          style: TextStyle(fontFamily: fontFamily.Sahelbold),
        ),
        leading: Icon(
          Icons.arrow_back,
        ),
      ),
      body: BasketUI(),
    );
  }

  Widget BasketUI() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 55),
          child: ListView.builder(
            itemCount: ShoppingBasketDeta.getInstance()!.basketItems!.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: ShoppingBasketItem(
                        ShoppingBasketDeta.getInstance()!.basketItems![position],
                        removeItem,
                        position)),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: (){

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    "پرداخت",
                    style: TextStyle(fontFamily: fontFamily.Sahel, fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      ShoppingBasketDeta.getInstance()!.basketItems!.removeAt(index);
    });
  }
}
