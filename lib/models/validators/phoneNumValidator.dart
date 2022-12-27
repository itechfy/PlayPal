String isMobileNumberValid(String? phoneNumber) {
  final phoneRegex = RegExp(r'(0|\+?92)3\d{9,11}$');

  if (phoneNumber == null || phoneNumber.isEmpty) {
    return "Please enter your phone number";
  } else if (!phoneRegex.hasMatch(phoneNumber)) {
    return 'Wrong format, try looking 03315970XXX ';
  }
  return '';
}
