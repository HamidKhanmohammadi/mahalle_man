import 'package:flutter/material.dart';
import 'package:mahalle_man/LoginPage.dart';
import 'package:mahalle_man/shoppingBasket.dart';

class BottomNavigator extends StatelessWidget {
  //const BottomNavigator({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 10,
      child: Container(
        height: 60,
        color: Colors.lime[700],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.blueGrey[600],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.blueGrey[600],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondAnimation) {
                            return LoginPage();
                          },
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondAnimation,
                              Widget child) {
                            return SlideTransition(
                              child: child,
                              position: Tween<Offset>(
                                  begin: Offset(1, 0), end: Offset(0, 0))
                                  .animate(CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.bounceIn)),
                            );
                          }));
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: Colors.blueGrey[600],
                  ),
                  //Icon(Icons.shopping_basket,color: Colors.blueGrey[600],),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_basket,
                      color: Colors.blueGrey[600],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondAnimation) {
                            return ShoppingBasket();
                          },
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondAnimation,
                              Widget child) {
                            return SlideTransition(
                              child: child,
                              position: Tween<Offset>(
                                      begin: Offset(1, 0), end: Offset(0, 0))
                                  .animate(CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.bounceIn)),
                            );
                          }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
