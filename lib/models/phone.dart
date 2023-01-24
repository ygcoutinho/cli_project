import 'dart:convert';

class Phone {
  int ddd;
  String phone;

  Phone({required this.ddd, required this.phone});

  //toMap
  Map<String, dynamic> toMap() {
    return {
      "ddd": ddd,
      "phone": phone,
    };
  }

  //toJson
  String toJson() => jsonEncode(toMap());

  //fromMap
  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(ddd: map["ddd"] ?? 0, phone: map["phone"] ?? "");
  }

  //fromJson
  factory Phone.fromJson(String json) => Phone.fromMap(jsonDecode(json));
}
