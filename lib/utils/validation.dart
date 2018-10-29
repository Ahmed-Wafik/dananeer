class ValidateInput {
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty || value == null) {
      return 'Can\'t be empty';
    } else if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }
    return null;
  }

  String validateUsername(String value) {
    if (value == '' || value == null) return 'Can\'t be empty';
    
    return null;
  }

  String validatePhone(String value) {
    if (value == '' || value == null)
      return 'Can\'t be empty';
    else
      return null;
  }
}
