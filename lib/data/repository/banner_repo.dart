import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mynt/data/api/api_client.dart';
import 'package:mynt/util/app_constants.dart';

class BannerRepo{
  final ApiClient apiClient;

  BannerRepo({@required this.apiClient});

  Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.CUSTOMER_BANNER);
  }
}