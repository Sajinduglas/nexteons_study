import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study/screen/teachers/list/controller/teachers_data_controller.dart';
import 'package:nexteons_study/screen/teachers/list/responsive/teachers_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../model/teachers_model.dart';

class TeachersDataGrid extends StatefulWidget {
  const TeachersDataGrid({super.key});

  @override
  State<TeachersDataGrid> createState() => _TeachersDataGridState();
}

class _TeachersDataGridState extends State<TeachersDataGrid> {
  final controller=Get.put(TeachersDataController());
  late List<Teachers> teachers;

  late TeachersDataSource teachersDataSource;

  @override
  void initState() {
    teachers = controller.getTeachersData();
    teachersDataSource = TeachersDataSource(teachers);
    controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfDataGrid(
            selectionMode: SelectionMode.multiple,
            allowSorting: true,
            source: teachersDataSource,
            columns: [
          GridColumn(
            columnName: "id",
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: Text(
                "id",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: "name",
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: Text(
                "name",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: "designation",
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: Text(
                "designation",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: "salary",
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: Text(
                "salary",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ]));
  }
}



class TeachersDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRow;

  TeachersDataSource(List<Teachers> teacherss) {
    dataGridRow = teacherss
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "id", value: dataGridRow.id),
              DataGridCell<String>(columnName: "name", value: dataGridRow.name),
              DataGridCell(
                  columnName: "designation", value: dataGridRow.designation),
              DataGridCell(columnName: "salary", value: dataGridRow.salary)
            ]))
        .toList();
  }

  List<DataGridRow> get rows => dataGridRow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row
            .getCells()
            .map<Widget>((dataGridCell) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: (dataGridCell.columnName == 'id' ||
                          dataGridCell.columnName == 'salary')
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    dataGridCell.value.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList());
    throw UnimplementedError();
  }
}


