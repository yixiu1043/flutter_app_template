import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class IdParam {
  IdParam({
    this.id,
  });

  final String? id;
}

@jsonSerializable
class IdsParam<T> {
  IdsParam({
    this.ids,
  });

  final List<T>? ids;
}
