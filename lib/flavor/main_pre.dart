import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/flavor/properties.dart';

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
