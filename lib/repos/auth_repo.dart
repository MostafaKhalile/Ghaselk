import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ghaselk/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/keys.dart';
import 'lang_repo.dart';

class AuthRepo with ChangeNotifier {
  Future login({String phoneNo, String password}) async {
    try {
      final String langCode = await LangRepo().getLocaleCode();
      final String _path = "$websiteUrl/$langCode/api/general/auth/login";
      final String mobileToken = 'bla bla bla'; // todo get fcm token
      Response _response = await Dio().post(_path,
          options: Options(
            headers: {"Accept": 'application/json'},
          ),
          data: {
            "phone": phoneNo,
            "password": password,
            "mobile_token": mobileToken
          });
      if (_response.statusCode == 200) {
        // corrent
        // save user auth token
        await _saveToken(token: _response.data['access_token']);
        // save user to shared prefrancess
        User user = User.fromJson(_response.data['user']);
        await _saveUserToPrefs(user: user);
        print('loged in successfully');
      } else {
        // err ocurerd
        return Future.error(_response.data['message']);
      }
    } catch (e) {
      print('err in login() with $e');
      return Future.error(e);
    }
  }

  Future signUpClient(
      {File image,
        String phoneNo,
        String password,
        String passwordConfirm,
        String name,
        String email,
        String address}) async {
    try {
      final String langCode = await LangRepo().getLocaleCode();
      final String _path = "$websiteUrl/$langCode/api/general/auth/register";
      final String mobileToken = 'bla bla bla'; // todo get fcm token
      final bytes = File(image.path).readAsBytesSync();
      final String img64 = base64Encode(bytes);

      Response _response = await Dio().post(_path,
          options: Options(
            headers: {"Accept": 'application/json'},
          ),
          data: {
            "phone": phoneNo,
            "type_role": 'client',
            "password": password,
            "password_confirmation": passwordConfirm,
            "mobile_token": mobileToken,
            "name": name,
            "email": email,
            "image": img64,
          });
      if (_response.statusCode == 200) {
        // corrent
        // save user auth token
        await _saveToken(token: _response.data['access_token']);
        // save user to shared prefrancess
        User user = User.fromJson(_response.data['user']);
        await _saveUserToPrefs(user: user);
        print('loged in successfully');
      } else {
        // err ocurerd
        return Future.error(_response.data['message']);
      }
    } catch (e) {
      print('err in signUpClient() with $e');
      return Future.error(e);
    }
  }

  Future signUpDriver({
    File profilePic,
    File nationalIdPic,
    File contractPic,
    File driverLicnsePic,
    File carFrontPic,
    File carBackPic,
    String phoneNo,
    String password,
    String passwordConfirm,
    String name,
    String gender,
    String email,
    String address,
  }) async {
    try {
      print(3);
      final String langCode = await LangRepo().getLocaleCode();
      final String _path = "$websiteUrl/$langCode/api/general/auth/signup";
      final String mobileToken = 'bla bla bla'; // todo get fcm token
      final profilePicBytes = File(profilePic.path).readAsBytesSync();
      final nationalIdPicBytes = File(nationalIdPic.path).readAsBytesSync();
      final contractPicBytes = File(contractPic.path).readAsBytesSync();
      final driverLicnsePicBytes = File(driverLicnsePic.path).readAsBytesSync();
      final carFrontPicBytes = File(carFrontPic.path).readAsBytesSync();
      final carBackPicBytes = File(carBackPic.path).readAsBytesSync();
      final String profilePic64 = base64Encode(profilePicBytes);
      final String nationalIdPic64 = base64Encode(nationalIdPicBytes);
      final String contractPic64 = base64Encode(contractPicBytes);
      final String driverLicnsePic64 = base64Encode(driverLicnsePicBytes);
      final String carFrontPic64 = base64Encode(carFrontPicBytes);
      final String carBackPic64 = base64Encode(carBackPicBytes);
print(4);
      Response _response = await Dio().post(_path,
          options: Options(
            headers: {"Accept": 'application/json'},
          ),
          data: {
            "phone": phoneNo,
            "type_role": 'client',
            "password": password,
            "password_confirmation": passwordConfirm,
            "mobile_token": mobileToken,
            "name": name,
            "email": email,
            "gender": gender,
            "id_card_image": nationalIdPic64,
            "car[form_img]": contractPic64,
            "car[license_img]": driverLicnsePic64,
            "car[front_img]": carFrontPic64,
            "car[back_img]": carBackPic64,
            "image": profilePic64,
          });
      print(_response);
      print(5);
      if (_response.statusCode == 200) {
        // corrent
        // save user auth token
        await _saveToken(token: _response.data['access_token']);
        // save user to shared prefrancess
        User user = User.fromJson(_response.data['user']);
        await _saveUserToPrefs(user: user);
        print('loged in successfully');
      } else {
        // err ocurerd
        return Future.error(_response.data['message']);
      }
    } catch (e) {
      print('err in signUpClient() with $e');
      return Future.error(e);
    }
  }

  Future<void> _saveUserToPrefs({User user}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userDataKey, jsonEncode(user.toJson()));
  }

  Future<void> _saveToken({String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(tokenKey, '$apiAuthKey $token');
  }

  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String token = preferences.getString(tokenKey);
    return token ?? '';
  }

  Future<User> getCurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userString = preferences.getString(userDataKey);
    final User user = User.fromJson(jsonDecode(userString));
    return user;
  }

  Future<bool> isLoggedIn() async {
    // if there is token then the user is logged In
    final prf = await SharedPreferences.getInstance();
    String token = prf.getString(userDataKey);
    return token != null;
  }

  Future<void> signOut() async {
    // this function will clear the shared preferencess
    final prf = await SharedPreferences.getInstance();
    await prf.clear();
  }
}