import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _fireBaseToken = 'AIzaSyD6xm39OlG1Sz9KL6q5z5qW32FXwEyQ6eg';
  final storage = new FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _fireBaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (decodedResp.containsKey('idToken')) {
      //guardar token en lugar seguro
      storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _fireBaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      //guardar token en lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return 'Invalid email or password';
      //decodedResp['error']['message']
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
