class Login {
  String _input;
  String _password;

  set setUserInput(String input) => this._input = input;
  set setUserPassword(String password) => this._password = password;

  String getUserInput() => _input;
  String getUserPassword() => _password;

  Map<String, dynamic> toJson() => {'UserName': _input, 'Password': _password};
}
