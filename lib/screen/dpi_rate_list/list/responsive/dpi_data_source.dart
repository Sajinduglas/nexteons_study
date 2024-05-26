import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../model/dpirate_model.dart';
import '../controller/dpi_rate_controller.dart';
class DpiDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];
  final DpiRateController controller;
  final Function(ListElement) onEdit;
  // final Function(String) onDelete;

  DpiDataSource( this.onEdit, this.controller) {
    dataGridRows = controller.dpiRateList.map<DataGridRow>((listItems) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: listItems.id),
        DataGridCell<String>(columnName: 'name', value: listItems.name),
        DataGridCell<int>(columnName: 'rate', value: listItems.rate),
        DataGridCell<IconButton>(columnName: 'edit', value: IconButton(icon: Icon(Icons.edit), onPressed: () => onEdit(listItems))),
        DataGridCell<IconButton>(columnName: 'delete', value: IconButton(icon: Icon(Icons.delete), onPressed: () => controller.deleteDpiRate(listItems.id!))),
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
