final window = Window(Navigator(''), Location(''));

class Window {
  final Navigator navigator;
  final Location location;

  Window(this.navigator, this.location);
}

class Navigator {
  final String userAgent;

  Navigator(this.userAgent);
}

class Location {
  final String href;

  Location(this.href);
}

class IFrameElement {
  set src(String value) => value;

  Style get style => Style();

  addEventListener(String name, Function callback) {}
}

class Style {
  set border(String value) => value;
}
