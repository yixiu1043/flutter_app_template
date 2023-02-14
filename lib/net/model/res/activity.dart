import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Activity {
  Activity({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;
}