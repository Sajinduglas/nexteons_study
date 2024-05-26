import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../model/dpirate_model.dart';
import '../../../../utils/contstant/app_config.dart';

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
    // final String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NTA1MjNkNmY4YTQ3MGViMTQ3MTE5OCIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1Mzk5NjUsImV4cCI6MTcxNzQwMzk2NSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.7lP49n4xPrY8DHQ76D-3H9IBlFTj01C6WS-mxgZCGQY";

    try {
      final response = await dio.post(
        AppConfig.url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print("Fetch Data Response: ${response.data}");
        DpiRateModel dpiRateModel = DpiRateModel.fromJson(response.data);
        dpiRateList.value = dpiRateModel.data?.dpiRateList?.list ?? [];
      } else {
        print("Error: ${response.statusCode} - ${response.statusMessage}");
      }
    } catch (e) {
      print("Error fetching data: $e");
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
    // final String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NTA1MjNkNmY4YTQ3MGViMTQ3MTE5OCIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1Mzk5NjUsImV4cCI6MTcxNzQwMzk2NSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.7lP49n4xPrY8DHQ76D-3H9IBlFTj01C6WS-mxgZCGQY";

    try {
      final response = await dio.post(
        AppConfig.url,
        data: body,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        print("Add DPI Rate Response: ${response.data}");
        final newId = response.data['data']['DPI_Rate_Create']['_id'];
        dpiRateList.add(
            ListElement(id: newId, name: dpiRate.name, rate: dpiRate.rate));
      } else {
        print("Error: ${response.statusCode} - ${response.statusMessage}");
      }
    } catch (e) {
      print("Error adding DPI rate: $e");
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

    // final String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NTA1MjNkNmY4YTQ3MGViMTQ3MTE5OCIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1Mzk5NjUsImV4cCI6MTcxNzQwMzk2NSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.7lP49n4xPrY8DHQ76D-3H9IBlFTj01C6WS-mxgZCGQY";

    try {
      final response = await dio.post(
        AppConfig.url,
        data: body,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        final index =
            dpiRateList.indexWhere((element) => element.id == dpiRate.id);
        if (index != -1) {
          dpiRateList[index] = dpiRate;
        }
      } else {
        print("Error: ${response.statusCode}");
        // Handle error response
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

    // final String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NTA1MjNkNmY4YTQ3MGViMTQ3MTE5OCIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1Mzk5NjUsImV4cCI6MTcxNzQwMzk2NSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.7lP49n4xPrY8DHQ76D-3H9IBlFTj01C6WS-mxgZCGQY";

    try {
      final response = await dio.post(
        AppConfig.url,
        data: body,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        // Handle success response
        await fetchData();
      } else {
        print("Error: ${response.statusCode}");
        // Handle error response
      }
    } catch (e) {
      print("Error: $e");
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
