import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:yx_app/flavor/properties.dart';

import '../main.dart';

void main() {
  Flavor.create(
    Environment.beta,
    color: Colors.green,
    name: '测试',
    properties: properties['qa'],
  );
  setupApp();
}
