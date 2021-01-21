import 'package:dio/dio.dart';
import 'package:mapane/models/alert.dart';
import 'package:mapane/utils/n_exception.dart';
import 'dart:convert';

import '../../di.dart';
import '../../service_locator.dart';

class AlertService {
  Future<List<Alert>> getAlerts() async {
    try {
      final String uri = locator<Di>().apiUrl + "/alerts";
      Response response = await locator<Di>().dio.get(
            uri,
            options: Options(headers: {"content-type": "application/json"}),
          );
      final items = response.data["alerts"].cast<Map<String, dynamic>>();
      List<Alert> schools = items.map<Alert>((json) {
        return Alert.fromJson(json);
      }).toList();
      return schools;
    } on DioError catch (e) {
      throw new NException(e);
    }
  }

  Future<List<Alert>> getAlertByUser(id) async {
    try {
      final String uri = locator<Di>().apiUrl + "/alerts/"+id;
      Response response = await locator<Di>().dio.get(
            uri,
            options: Options(headers: {"content-type": "application/json"}),
          );
      print(response.data);
      final items = response.data["alerts"].cast<Map<String, dynamic>>();
      List<Alert> schools = items.map<Alert>((json) {
        return Alert.fromJson(json);
      }).toList();
      return schools;
    } on DioError catch (e) {
      throw new NException(e);
    }
  }
}

final AlertService alertService = AlertService();
