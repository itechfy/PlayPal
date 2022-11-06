String isPasswordValid(String? pwd) {
  String regexPattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
  var regExp = new RegExp(regexPattern);

  if (pwd == null || pwd.isEmpty) {
    return "Please enter your password";
  } else if (regExp.hasMatch(pwd)) {
    return '';
  }
  return 'Password must contain atleast one capital letter, small letter, number and special character';
}
