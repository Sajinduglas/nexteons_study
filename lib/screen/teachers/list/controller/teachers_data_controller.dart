import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../model/teachers_model.dart';
import '../../../../utils/contstant/app_config.dart';

class TeachersDataController extends GetxController {
  final Dio dio = Dio();

  RxList<Teachers> getTeachersData() {
    return [
      Teachers(id: 1, name: "amos", designation: "flutter", salary: 10000),
      Teachers(id: 2, name: "najeeb", designation: "flutter", salary: 10000),
      Teachers(id: 1, name: "amos", designation: "flutter", salary: 10000),
      Teachers(id: 2, name: "najeeb", designation: "flutter", salary: 10000),
      Teachers(id: 1, name: "amos", designation: "flutter", salary: 10000),
      Teachers(id: 2, name: "najeeb", designation: "flutter", salary: 10000),
    ].obs;
  }

  Future<void> fetchData() async {
    final body = {
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
    final String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NTA1MjNkNmY4YTQ3MGViMTQ3MTE5OCIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1Mzk5NjUsImV4cCI6MTcxNzQwMzk2NSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.7lP49n4xPrY8DHQ76D-3H9IBlFTj01C6WS-mxgZCGQY";
    try {
      final response = await dio.post(
        AppConfig.url,
        data: body,
        options: Options(
          headers: {
            // 'Content-Type': 'application/json',
            'X-Tenant-Id': "RL0582",
            "Authorization": "Bearer ${token}"
          },
        ),
      );

      if(response.statusCode==200){
        print("statuscode${response.statusCode}");
        print(response.data);
      }
      else{
        print("statuscode${response.statusCode}");
      }
    } catch (e) {}
  }
}
