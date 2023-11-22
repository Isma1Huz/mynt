import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mynt/data/api/api_client.dart';
import 'package:mynt/util/app_constants.dart';

class NotificationRepo{
  final ApiClient apiClient;

  NotificationRepo({@required this.apiClient});

  Future<Response> getNotificationList() async {
    return await apiClient.getData(AppConstants.NOTIFICATION_URI);
  }
}