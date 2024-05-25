
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study/global_widgets/save_&_proceed_button.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../model/dpirate_model.dart';
import '../../../../utils/contstant/app_config.dart';
import '../controller/teachers_data_controller.dart';

class TeachersDataGrid extends StatefulWidget {
  const TeachersDataGrid({super.key});

  @override
  State<TeachersDataGrid> createState() => _TeachersDataGridState();
}

class _TeachersDataGridState extends State<TeachersDataGrid> {
  final controller = Get.put(TeachersDataController());

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  void _showAddDialog() {
    final idController = TextEditingController();
    final nameController = TextEditingController();
    final rateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add DPI Rate'),
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
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {

                final name = nameController.text;
                final rate = int.tryParse(rateController.text) ?? 0;

                controller.addDpiRate(ListElement( name: name, rate: rate));
                Navigator.of(context).pop();
                setState(() {

                });
              },
              child: Text('Add'),
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
        final teachersDataSource = TeachersDataSource(controller.dpiRateList);
        return Column(
          children: [
            Expanded(
              child: SfDataGrid(
                selectionMode: SelectionMode.multiple,
                allowSorting: true,
                source: teachersDataSource,
                columns: [
                  GridColumn(
                    columnName: 'id',
                    label: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'ID',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'name',
                    label: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'rate',
                    label: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Rate',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class TeachersDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];

  TeachersDataSource(List<ListElement> dpiRateList) {
    dataGridRows = dpiRateList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
        DataGridCell<int>(columnName: 'rate', value: dataGridRow.rate),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: dataGridCell.columnName == 'rate' ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}


