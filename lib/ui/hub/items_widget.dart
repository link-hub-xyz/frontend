import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/core/model/item.dart';

class ItemsListProps extends Equatable {
  final Iterable<Item> items;
  final VoidCallback? create;
  final void Function(String id) onPressed;

  const ItemsListProps({
    required this.create,
    required this.items,
    required this.onPressed,
  });

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
              if (props.create != null)
                IconButton(
                  onPressed: props.create,
                  icon: const Icon(Icons.add),
                )
            ],
            rowsPerPage: 4,
            columns: [
              const DataColumn(label: Text('Origin')),
              const DataColumn(label: Text('Created')),
              if (props.create != null) const DataColumn(label: Text('Clicks')),
            ],
            source: _DataSource(
              context: context,
              isOwnHub: props.create != null,
              items: props.items,
              onPressed: props.onPressed,
            ),
          ),
        ],
      );
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final Set<int> _selectedindexes = Set.identity();
  final Iterable<Item> items;
  final bool isOwnHub;
  final void Function(String id) onPressed;

  _DataSource({
    required this.context,
    required this.items,
    required this.isOwnHub,
    required this.onPressed,
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
        DataCell(
          kIsWeb ? _LinkText(text: Text(item.origin)) : Text(item.origin),
          onTap: () => onPressed(item.id),
        ),
        const DataCell(Text('Nov 23')),
        if (isOwnHub) const DataCell(Text('0')),
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

class _LinkText extends StatefulWidget {
  final Widget text;
  const _LinkText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  __LinkTextState createState() => __LinkTextState();
}

class __LinkTextState extends State<_LinkText> {
  bool isHovered = false;

  void _onEnter(PointerEvent details) {
    setState(() => isHovered = true);
  }

  void _onExit(PointerEvent details) {
    setState(() => isHovered = false);
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: Row(children: [
          DefaultTextStyle(
            style: TextStyle(
              color: isHovered ? Colors.blue : null,
            ),
            child: widget.text,
          ),
          const SizedBox(width: 8),
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            visible: isHovered,
            child: const Icon(
              Icons.open_in_new_outlined,
              size: 16,
              color: Colors.blue,
            ),
          ),
        ]),
      );
}
