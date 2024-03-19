import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'BottomNavigator.dart';
import 'DescriptionPage.dart';
import 'Products.dart';



class Store extends StatefulWidget {
  //const HomeMaterial({Key key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}


class _StoreState extends State<Store> {
  List<Products> _items = [];

  var myName = "Master";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchItems();
  }

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

            UserAccountsDrawerHeader(
              accountName: Text("master",style: TextStyle(fontFamily: fontFamily.Sahel, ),),
              accountEmail: Text("hamiiiid62@yahoo.com",style: TextStyle(fontFamily: fontFamily.Sahel,),),

              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                child: Text(
                  myName[0],
                ),
              ),
              onDetailsPressed: (){
                Text("sdsa;jjhna;sll;as");
              },
              arrowColor: Colors.greenAccent,
              decoration: BoxDecoration(
                //color: Colors.lime[800]
                gradient: LinearGradient(
                  colors: [
                    Colors.lime,
                    Colors.lightGreen
                  ]
                ),
              ),
            ),

            Divider(),
            ListTile(
              title: Text("اطلاعات کاربری", textDirection: TextDirection.rtl,),
              trailing: Icon(Icons.perm_identity),
            ),
            Divider(),
            ListTile(
              title: Text("پیام ها", textDirection: TextDirection.rtl,),
              trailing: Icon(Icons.notifications_active_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("پرسش های متداول", textDirection: TextDirection.rtl,),
              trailing: Icon(Icons.question_answer_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("پشتیبانی", textDirection: TextDirection.rtl,),
              trailing: Icon(Icons.support),
            ),
            Divider(),
            ListTile(
              title: Text("قوانین و مقررات", textDirection: TextDirection.rtl,),
              trailing: Icon(Icons.rule_folder_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("ارتباط با ما", textDirection: TextDirection.rtl,),
              trailing: Icon(Icons.headphones),
            ),
            Divider(),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children:
          List.generate(_items.length ,(int position){
            return generateItems(_items[position], context);
          }),
        ),
      ),

      bottomNavigationBar: BottomNavigator(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.red[400],
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );;
  }

  void fetchItems() async{
    var uri = Uri.parse("http://welearnacademy.ir/flutter/products_list.json");
    Response response = await get(uri);
    print("My result : ${utf8.decode(response.bodyBytes)}");

    setState(() {
      var productJson = json.decode(utf8.decode(response.bodyBytes));
      for(var i in productJson){
        var productItem = Products(i['product_name'],i['id'],i['price'],i['image_url'],i['off'],i['description'],);
        _items.add(productItem);
      }
    });
  }
}

Card generateItems(Products products, context){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    elevation: 3,
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DescriptionPage(products)
        ));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              child: Image.network(products.imageUrl),
            ),
            Text(
              products.price,
              style: TextStyle(
                fontFamily: fontFamily.Sahel,
                fontSize: 16,
                color: Colors.red[900],
              ),
            ),
            Text(
              products.productName,
              style: TextStyle(
                fontFamily: fontFamily.Sahel,
                fontSize: 13,
                color: Color(0xFF575E67),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}