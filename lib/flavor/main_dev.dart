import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:yx_app/flavor/properties.dart';

import '../main.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'dev',
    properties: properties['dev'],
  );
  setupApp();
}
