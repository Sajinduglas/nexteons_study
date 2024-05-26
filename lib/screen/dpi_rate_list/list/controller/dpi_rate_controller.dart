import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study/repository/dpi_rate_list/dpi_rate_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../model/dpirate_model.dart';
import '../../../../utils/appsnackbar.dart';
import '../../../../utils/contstant/app_config.dart';
import '../../../../utils/contstant/app_constants.dart';

class DpiRateController extends GetxController {
  late SharedPreferences preferences;
  final nameController = TextEditingController();
  final rateController = TextEditingController();
  final Dio dio = Dio();
  var dpiRateList = <ListElement>[].obs;
  var isLoading = false.obs; // Add isLoading observable
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true; // Set loading to true
    Map<String, dynamic> headers = await getApiheaders();
    if (headers.isEmpty) {
      var message = "failed to get api headers";
      print("$message");
      return;
    }
    Map<String, dynamic> body = {
      'query': '''
      query List(\$filterOptions: ListDpiInput!) {
        DpiRate_List(FilterOptions: \$filterOptions) {
          list {
            _name
            _rate
            _id
          }
          totalCount
        }
      }
      ''',
      'variables': {
        "filterOptions": {
          "branchIds": "6631da5ce9efa0bd84a86852",
          "limit": -1,
          "skip": 0,
          "statusArray": [1]
        }
      }
    };


    try {
     var responseBody= await DpiRateService.fetchData(header: headers, data: body);

      if (responseBody["data"]!=null) {

        DpiRateModel dpiRateModel = DpiRateModel.fromJson(responseBody);
        dpiRateList.value = dpiRateModel.data?.dpiRateList?.list ?? [];
        AppSnackbar.oneTimeSnackBar("Success",
            context: navigatorKey.currentContext!, bgColor: Colors.green);
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
    } catch (e) {
      print("an error occured $e");
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> addDpiRate(ListElement dpiRate) async {
    isLoading.value = true; // Set loading to true
    Map<String, dynamic> headers = await getApiheaders();
    if (headers.isEmpty) {
      var message = "failed to get api headers";
      print("$message");
      return;
    }
    Map<String, dynamic> body = {
      'query': '''
mutation DPI_Rate_Create(\$createDpiRateInput: CreateDpiRateInput!) {
  DPI_Rate_Create(createDpiRateInput: \$createDpiRateInput) {
    _id
  }
}
''',
      'variables': {
        "createDpiRateInput": {
          "_branchId": "6631da5ce9efa0bd84a86852",
          "_name": dpiRate.name,
          "_rate": dpiRate.rate,
        }
      },
    };

    try {
      var responsebody =
      await DpiRateService.fetchData(header: headers, data: body);
      if (responsebody["data"]!=null) {

        final newId = responsebody['data']['DPI_Rate_Create']['_id'];
        dpiRateList.add(
            ListElement(id: newId, name: dpiRate.name, rate: dpiRate.rate));
        AppSnackbar.oneTimeSnackBar("Success",
            context: navigatorKey.currentContext!, bgColor: Colors.green);
        await fetchData();
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
    } catch (e) {
      print("an error occured: $e");
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> updateDpiRate(ListElement dpiRate) async {
    Map<String, dynamic> headers = await getApiheaders();
    if (headers.isEmpty) {
      var message = "failed to get api headers";
      print("$message");
      return;
    }
    final body = {
      'query': '''
mutation DPI_Rate_Update(\$updateDpiRateInput: UpdateDpiRateInput!) {
  DPI_Rate_Update(updateDpiRateInput: \$updateDpiRateInput) {
    _id
  }
}
''',
      'variables': {
        "updateDpiRateInput": {
          "_branchId": "6631da5ce9efa0bd84a86852",
          "_editCount": -1,
          "_id": dpiRate.id,
          "_name": dpiRate.name,
          "_rate": dpiRate.rate
        }
      },
    };


    try {
      var responsebody =
      await DpiRateService.fetchData(header: headers, data: body);


      if (responsebody["data"] != null) {

        final index =
        dpiRateList.indexWhere((element) => element.id == dpiRate.id);
        if (index != -1) {
          dpiRateList[index] = dpiRate;
          AppSnackbar.oneTimeSnackBar("edited Successfully",
              context: navigatorKey.currentContext!, bgColor: Colors.green);
          await fetchData();
        }
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
    } catch (e) {
      print("Error: $e");
      // Handle error
    }
  }

  Future<void> deleteDpiRate(String id) async {
    Map<String, dynamic> headers = await getApiheaders();
    if (headers.isEmpty) {
      var message = "failed to get api headers";
      print("$message");
      return;
    }
    Map<String, dynamic> body = {
      'query': '''
mutation DPI_Rate_StatusChange(\$statusChange: StatusChangeInput!) {
  DPI_Rate_StatusChange(statusChange: \$statusChange) {
    message
}
}
''',
      'variables': {
        "statusChange": {
          "_editCount": -1,
          "_logDescription": null,
          "_status": "DELETE",
          "ids": [id]
        }
      }
    };


    try {
      var responsebody =
      await DpiRateService.fetchData(header: headers, data: body);

      if (responsebody["data"]!=null) {
        AppSnackbar.oneTimeSnackBar("deleted ",
            context: navigatorKey.currentContext!, bgColor: Colors.green);

        await fetchData();
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
        // Handle error response
      }
    } catch (e) {
      print(" an Error in api: $e");
      // Handle error
    }
  }

  Future<Map<String, dynamic>> getApiheaders() async {
    preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString(AppConfig.accessToken);
    if (accessToken != null) {
      return {'X-Tenant-Id': "RL0582", "Authorization": "Bearer $accessToken"};
    } else {
      return {};
    }
  }
}
