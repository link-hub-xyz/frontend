import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NewItemProps extends Equatable {
  final VoidCallback back;
  final void Function(String)? create;

  const NewItemProps({
    required this.back,
    required this.create,
  });

  @override
  List<Object?> get props => [
        back,
        create,
      ];
}

class NewItemWidget extends StatefulWidget {
  final NewItemProps props;
  const NewItemWidget({
    Key? key,
    required this.props,
  }) : super(key: key);

  @override
  State<NewItemWidget> createState() => _NewItemWidgetState();
}

class _NewItemWidgetState extends State<NewItemWidget> {
  late TextEditingController _titleController;
  final _uriKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    // _titleController.addListener(() => setState(() {}));
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
                      'Create new Item',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter the item url you want people to see when they visit your Hub.\nIt can be any web site you want to share.',
                  style: Theme.of(context).textTheme.caption,
                ),
                const Spacer(),
                FractionallySizedBox(
                  widthFactor: 3 / 5,
                  child: Form(
                    key: _uriKey,
                    child: TextFormField(
                      onEditingComplete: () => {
                        _uriKey.currentState?.validate() == true,
                        setState(() {}),
                        FocusScope.of(context).requestFocus(FocusNode()),
                      },
                      validator: (uri) {
                        if (uri != null) {
                          try {
                            final parsed = Uri.parse(uri);
                            if (parsed.isAbsolute && parsed.origin.isNotEmpty) {
                              return null;
                            }
                            return 'Please, enter valid url.';
                          } on FormatException catch (e) {
                            return e.message;
                          } catch (e) {
                            return 'Please, enter valid url.';
                          }
                        }
                        return null;
                      },
                      controller: _titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        helperText: 'URL',
                        labelText: 'https://example.com',
                      ),
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
                  onPressed: _titleController.text.isNotEmpty &&
                          _uriKey.currentState?.validate() == true
                      ? () => widget.props.create!(_titleController.text)
                      : null,
                  child: const Text('Create'),
                ),
                replacement: const CircularProgressIndicator(strokeWidth: 2),
              ),
            ]),
      );
}
