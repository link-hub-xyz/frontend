import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class NewHubProps extends Equatable {
  final VoidCallback back;
  final void Function(String)? create;

  const NewHubProps({
    required this.back,
    required this.create,
  });

  @override
  List<Object?> get props => [
        back,
        create,
      ];
}

class NewHubWidget extends StatefulWidget {
  final NewHubProps props;

  const NewHubWidget({
    Key? key,
    required this.props,
  }) : super(key: key);

  @override
  State<NewHubWidget> createState() => _NewHubWidgetState();
}

class _NewHubWidgetState extends State<NewHubWidget> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _titleController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) => ClipRRect(
        child: AlertDialog(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            titlePadding: EdgeInsets.zero,
            title: Container(
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create new Hub',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    _StepsWidget(),
                  ],
                ),
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter the title you want people to see when they visit your Hub.\nIt can be topic (Management, IT, Aviation etc.) or social networks (Instagram, Facebook) you want your hub place at.',
                  style: Theme.of(context).textTheme.caption,
                ),
                const Spacer(),
                FractionallySizedBox(
                  widthFactor: 3 / 5,
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      helperText: 'Title',
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            actionsPadding: const EdgeInsets.all(16.0),
            actions: [
              Visibility(
                visible: widget.props.create != null,
                child: TextButton(
                  onPressed: widget.props.back,
                  child: const Text('Cancel'),
                ),
              ),
              Visibility(
                visible: widget.props.create != null,
                child: ElevatedButton(
                  onPressed: _titleController.text.isNotEmpty
                      ? () => widget.props.create!(_titleController.text)
                      : null,
                  child: const Text('Create'),
                ),
                replacement: CircularProgressIndicator(strokeWidth: 2),
              ),
            ]),
      );
}

class _StepsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.white,
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Row(
            children: const [
              Text('1'),
              SizedBox(width: 4),
              Text('Enter title'),
              SizedBox(width: 8),
              Expanded(child: Divider()),
              SizedBox(width: 8),
              Text('2'),
              SizedBox(width: 4),
              Text('Fullfill'),
              SizedBox(width: 8),
              Expanded(child: Divider()),
              SizedBox(width: 8),
              Text('3'),
              SizedBox(width: 4),
              Text('Share'),
              Spacer(flex: 3),
            ],
          ),
        ),
      );
}

@immutable
class _Circle extends StatelessWidget {
  Widget child;
  Color? color;

  _Circle({required this.child, this.color});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: color,
          child: child,
        ),
      );
}
