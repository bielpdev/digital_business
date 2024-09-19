import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:digital_business/src/model/card_model.dart';
import 'package:digital_business/src/versions/desktop_version.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

//TODO: Pesquisar sobre repository pattern
class BusinessCardRepository {
  var getCode = Uri.base.queryParameters['userid'];

  Future<CardModel> getUser() async {
    var defaultId = 0;
    var userid = getCode ?? defaultId;
    var url = Uri.parse(
        'https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/$userid');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var x = jsonDecode(response.body);
      return CardModel.fromJson(x);
    } else {
      throw Exception('Erro ao receber os dados');
    }
  }

  Future<void> launchLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Error para realizar a ação');
    }
  }

  static Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Rodando em um dispositivo Android: ${androidInfo.model}');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Rodando em um dispositivo iOS: ${iosInfo.utsname.machine}');
    } else if (Platform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      print('Rodando em um dispositivo Linux: ${linuxInfo.name}');
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
      print('Rodando em um dispositivo macOS: ${macInfo.model}');
    } else if (Platform.isWindows) {
      runApp(DesktopVersion(
        repository: BusinessCardRepository(),
      ));
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      print('Rodando em um dispositivo Windows: ${windowsInfo.computerName}');
    } else {
      print('Plataforma desconhecida');
    }
  }
}
