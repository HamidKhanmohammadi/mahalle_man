import 'package:flutter/material.dart';
import 'package:mahalle_man/Products.dart';

import 'lang/faLang.dart';

var lang = new FaLang();
var fontFamily = new FontFamily();

class ShoppingBasketItem extends StatefulWidget {
  Products _products;
  int _count = 0;
  int index = 0;
  OnRemovePressed _onRemovePressed;

  ShoppingBasketItem(this._products, this._onRemovePressed, this.index);

  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 170,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Image.network(
                widget._products.imageUrl,
                width: 100,
                height: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 1),
                  child: Text(
                    widget._products.productName,
                    style:
                        TextStyle(fontFamily: fontFamily.Sahel, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.chevron_right,
                          size: 35,
                        ),
                        onTap: () {
                          Increment();
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget._count.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.chevron_left,
                          size: 35,
                        ),
                        onTap: () {
                          Decrement();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          widget._onRemovePressed(widget.index);
                        },
                          child: Icon(Icons.delete_outline)
                      ),
                      Text(widget._products.price,
                          style: TextStyle(
                              fontFamily: fontFamily.Sahel, fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Increment() {
    setState(() {
      widget._count++;
    });
  }

  void Decrement() {
    setState(() {
      if (widget._count == 0) return;

      widget._count--;
    });
  }
}

typedef OnRemovePressed(int index);
