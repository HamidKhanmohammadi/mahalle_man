class LoginResponseModel {
  int _result = 0;
  late String _message;


  LoginResponseModel(this._result, this._message);

  int get result => _result;

  set result(int value) {
    _result = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }
}