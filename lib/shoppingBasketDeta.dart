import 'package:mahalle_man/Products.dart';

class ShoppingBasketDeta{

  static ShoppingBasketDeta? _instance ;
  List<Products>? _basketItems;

  ShoppingBasketDeta(){
    _basketItems = <Products>[];
  }


  List<Products>? get basketItems => _basketItems;

  set basketItems(List<Products>? value) {
    _basketItems = value;
  }

  static ShoppingBasketDeta? getInstance(){
    if(_instance == null){
      _instance = ShoppingBasketDeta();
    }
    return _instance;
  }
}