
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study/utils/contstant/app_constants.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../model/dpirate_model.dart';
import '../controller/dpi_rate_controller.dart';
import 'dpi_data_source.dart';


class DpiDataGrid extends StatelessWidget {
   DpiDataGrid({super.key});

  final controller = Get.put(DpiRateController());

  void showAddDialog() {


    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Text('Add DPI Rate'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: controller.rateController,
                decoration: InputDecoration(labelText: 'Rate'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                navigatorKey.currentContext!.pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final name = controller.nameController.text;
                final rate = int.tryParse(controller.rateController.text) ?? 0;
                controller.addDpiRate(ListElement(name: name, rate: rate));
                controller.nameController.clear();
                controller.rateController.clear();
                navigatorKey.currentContext!.pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void showEditDialog(ListElement dpiRate) {
    final nameController = TextEditingController(text: dpiRate.name);
    final rateController = TextEditingController(text: dpiRate.rate.toString());

    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit DPI Rate'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: rateController,
                decoration: InputDecoration(labelText: 'Rate'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                navigatorKey.currentContext!.pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final name = nameController.text;
                final rate = int.tryParse(rateController.text) ?? 0;
                controller.updateDpiRate(ListElement(id: dpiRate.id, name: name, rate: rate));
                // Navigator.of(context).pop();
                navigatorKey.currentContext!.pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        } else {
          final dpiDataSource = DpiDataSource(showEditDialog, controller);
          return Column(
            children: [
              Expanded(
                child: SfDataGrid(
                  selectionMode: SelectionMode.multiple,
                  allowSorting: true,
                  source: dpiDataSource,
                  columns: [
                    GridColumn(
                      columnName: 'id',
                      label: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: Text(
                          'ID',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'name',
                      label: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: Text(
                          'Name',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'rate',
                      label: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: Text(
                          'Rate',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'edit',
                      label: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: Text(
                          'Edit',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'delete',
                      label: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: Text(
                          'Delete',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

