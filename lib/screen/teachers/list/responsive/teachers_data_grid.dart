import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TeachersDataGrid extends StatefulWidget {
  const TeachersDataGrid({super.key});

  @override
  State<TeachersDataGrid> createState() => _TeachersDataGridState();
}

class _TeachersDataGridState extends State<TeachersDataGrid> {
  late List<Teachers> teachers;

  late TeachersDataSource teachersDataSource;

  @override
  void initState() {
    teachers = getTeachersData();
    teachersDataSource = TeachersDataSource(teachers);
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

List<Teachers> getTeachersData() {
  return [
    Teachers(id: 1, name: "amos", designation: "flutter", salary: 10000),
    Teachers(id: 2, name: "najeeb", designation: "flutter", salary: 10000),
    Teachers(id: 1, name: "amos", designation: "flutter", salary: 10000),
    Teachers(id: 2, name: "najeeb", designation: "flutter", salary: 10000),
    Teachers(id: 1, name: "amos", designation: "flutter", salary: 10000),
    Teachers(id: 2, name: "najeeb", designation: "flutter", salary: 10000),
  ];
}

class TeachersDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRow;

  TeachersDataSource(List<Teachers> teacherss) {
    dataGridRow = teacherss
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "ID", value: dataGridRow.id),
              DataGridCell<String>(columnName: "Name", value: dataGridRow.name),
              DataGridCell(
                  columnName: "Designation", value: dataGridRow.designation),
              DataGridCell(columnName: "Salary", value: dataGridRow.salary)
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

class Teachers {
  final int id;
  final String name;
  final String designation;
  final int salary;

  Teachers(
      {required this.id,
      required this.name,
      required this.designation,
      required this.salary});
}
