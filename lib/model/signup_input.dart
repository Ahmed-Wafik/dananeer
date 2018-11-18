class SignupInput {
  //String _username;
  String _email;
  String _password;
  String _phone;
  // String _image;

  // String get getUsername => _username;
  String get getEmail => _email;
  String get getPassword => _password;
  String get getPhone => _phone;
  // String get geImage => _image;

  // set setProfilePic(String image) => this._image = image;
//  set setUsername(String username) => this._username = username.trim();
  set setEmail(String email) => this._email = email.trim();
  set setPhone(String phone) => this._phone = phone.trim();
  set setPassword(String password) => this._password = password.trim();

  Map<String, dynamic> toJson() => {
        'Email': _email,
        'Phone': _phone,
        'Password': _password,
      };
  @override
  String toString() {
    return 'email $_email : password $_password : phone $_phone';
  }
}
