import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'hub.g.dart';

@CopyWith()
class Hub extends Equatable {
  final String id;
  final String creator;
  final String name;
  final String url;
  final Iterable<String> items;

  const Hub({
    required this.id,
    required this.creator,
    required this.name,
    required this.url,
    required this.items,
  });

  @override
  List<Object?> get props => [
        id,
        creator,
        name,
        url,
        items,
      ];
}
