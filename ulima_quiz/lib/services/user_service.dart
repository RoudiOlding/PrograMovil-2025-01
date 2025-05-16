import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/service_http_response.dart';
import '../models/entitties/user.dart';

class UserService {
  Future<ServiceHttpResponse?> signIn(User u) async {
    ServiceHttpResponse serviceResponse = ServiceHttpResponse();
    // leer json y crear lista de objetos
    final String body = await rootBundle.loadString('assets/jsons/users.json');
    final List<dynamic> data = jsonDecode(body);
    List<User> users = [];
    users =
        data.map((map) => User.fromJson(map as Map<String, dynamic>)).toList();
    User? userFound = null;
    for (User user in users) {
      print("=====================");
      print(user);
      print(u);
      if (user.username == u.username && user.password == u.password) {
        userFound = user;
      }
    }
    print(userFound);
    if (userFound != null) {
      serviceResponse.status = 200;
      serviceResponse.body = userFound;
    } else {
      serviceResponse.status = 401;
      serviceResponse.body = ':(';
    }
    return serviceResponse;
  }
}
