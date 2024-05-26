
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../model/dpirate_model.dart';
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
                controller.addDpiRate(ListElement(name: name, rate: rate));
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(ListElement dpiRate) {
    final nameController = TextEditingController(text: dpiRate.name);
    final rateController = TextEditingController(text: dpiRate.rate.toString());

    showDialog(
      context: context,
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
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final name = nameController.text;
                final rate = int.tryParse(rateController.text) ?? 0;
                controller.updateDpiRate(ListElement(id: dpiRate.id, name: name, rate: rate));
                Navigator.of(context).pop();
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
          final teachersDataSource = TeachersDataSource(controller.dpiRateList, _showEditDialog, controller.deleteDpiRate);
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
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class TeachersDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];
  final Function(ListElement) onEdit;
  final Function(String) onDelete;

  TeachersDataSource(List<ListElement> dpiRateList, this.onEdit, this.onDelete) {
    dataGridRows = dpiRateList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
        DataGridCell<int>(columnName: 'rate', value: dataGridRow.rate),
        DataGridCell<IconButton>(columnName: 'edit', value: IconButton(icon: Icon(Icons.edit), onPressed: () => onEdit(dataGridRow))),
        DataGridCell<IconButton>(columnName: 'delete', value: IconButton(icon: Icon(Icons.delete), onPressed: () => onDelete(dataGridRow.id!))),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'edit' || dataGridCell.columnName == 'delete') {
          return dataGridCell.value;
        }
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
