class User {
  String name;
  String phoneNumber;
  String password;

  User(this.name, this.phoneNumber, this.password);

  //method to convert model to json
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}
