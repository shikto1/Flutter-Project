
class LoginResponse {
  String name;
  int age;
  String car;

  LoginResponse({this.name, this.age, this.car});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    car = json['car'];
  }
}


/**
 * https://app.quicktype.io
 * https://javiercbk.github.io/json_to_dart/
 * */