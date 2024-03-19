class Products {
  String _productName;
  int _id;
  String _price;
  String _imageUrl;
  bool _off;
  String _description;

  Products(this._productName, this._id, this._price, this._imageUrl, this._off,
      this._description);

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  bool get off => _off;

  set off(bool value) {
    _off = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }
}
