import 'package:yx_app/net/exception/activity_exception.dart';

class AuthFailException extends ActivityException {
  final int code;
  final String message;

  AuthFailException(this.code, this.message);
}