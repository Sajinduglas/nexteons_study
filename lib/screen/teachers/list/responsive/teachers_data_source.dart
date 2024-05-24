// import 'package:flutter/material.dart';
// import 'package:nexteons_study/screen/teachers/list/responsive/teachers_data_grid.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// class TeachersDataSource extends DataGridSource {
//   late List<DataGridRow> dataGridRow;
//
//   TeachersDataSource(List<Teachers> teacherss) {
//     dataGridRow = teacherss
//         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
//       DataGridCell<int>(columnName: "ID", value: dataGridRow.id),
//       DataGridCell<String>(columnName: "Name", value: dataGridRow.name),
//       DataGridCell(
//           columnName: "Designation", value: dataGridRow.designation),
//       DataGridCell(columnName: "Salary", value: dataGridRow.salary)
//     ]))
//         .toList();
//   }
//
//   List<DataGridRow> get rows => dataGridRow;
//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row
//             .getCells()
//             .map<Widget>((dataGridCell) => Container(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           alignment: (dataGridCell.columnName == 'id' ||
//               dataGridCell.columnName == 'salary')
//               ? Alignment.centerRight
//               : Alignment.centerLeft,
//           child: Text(
//             dataGridCell.value.toString(),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ))
//             .toList());
//     throw UnimplementedError();
//   }
// }