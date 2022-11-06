String isMobileNumberValid(String? phoneNumber) {
  String regexPattern = r'^(?:[0][1-9])?[0-9]{11}$';
  var regExp = new RegExp(regexPattern);

  if (phoneNumber == null || phoneNumber.isEmpty) {
    return "Please enter your phone number";
  } else if (regExp.hasMatch(phoneNumber)) {
    return '';
  }
  return 'Wrong format, try looking 0331 XXXX XXX ';
}
