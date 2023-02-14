import 'activity_exception.dart';

class ServerException implements ActivityException {
  final int code;
  final String message;

  ServerException(this.code, this.message);
}
