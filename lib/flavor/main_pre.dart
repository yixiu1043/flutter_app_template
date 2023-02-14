import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:yx_app/flavor/properties.dart';

import '../main.dart';

void main() {
  Flavor.create(
    Environment.alpha,
    color: Colors.green,
    name: '预发',
    properties: properties['pre'],
  );
  setupApp();
}
