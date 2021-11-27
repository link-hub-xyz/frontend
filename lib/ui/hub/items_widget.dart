import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/core/model/item.dart';

class ItemsListProps extends Equatable {
  final Iterable<Item> items;

  const ItemsListProps({required this.items});

  @override
  List<Object?> get props => [items];
}

class ItemsListWidget extends StatelessWidget {
  final ItemsListProps props;

  const ItemsListWidget({
    Key? key,
    required this.props,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaginatedDataTable(
            header: const Text('Items'),
            actions: [
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.add),
              )
            ],
            rowsPerPage: 4,
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Created')),
              DataColumn(label: Text('Origin')),
              DataColumn(label: Text('Clicks')),
            ],
            source: _DataSource(context: context, items: props.items),
          ),
        ],
      );
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final Set<int> _selectedindexes = Set.identity();
  final Iterable<Item> items;

  _DataSource({
    required this.context,
    required this.items,
  });

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= items.length) return null;
    final item = items.elementAt(index);
    return DataRow.byIndex(
      index: index,
      selected: _selectedindexes.contains(index),
      onSelectChanged: (value) {
        value == true
            ? _selectedindexes.add(index)
            : _selectedindexes.remove(index);
        notifyListeners();
      },
      cells: [
        DataCell(Text(item.id)),
        const DataCell(Text('Nov 23')),
        DataCell(Text(item.url)),
        const DataCell(Text('0')),
      ],
    );
  }

  @override
  int get rowCount => items.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedindexes.length;
}
