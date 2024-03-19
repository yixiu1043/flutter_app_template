part of './app_pages.dart';

abstract class Routes {
  static const INITIAL = _Paths.INITIAL;
  static const HOME = _Paths.HOME;
  static const PROMOTION = _Paths.PROMOTION;
  static const MINE = _Paths.MINE;
  static const PROXY_SET = _Paths.PROXY_SET;
}

abstract class _Paths {
  static const INITIAL = '/home';
  static const HOME = '/home';
  static const PROMOTION = '/promotion';
  static const MINE = '/mine';
  static const PROXY_SET = '/proxy_set';
}
