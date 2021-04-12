@JS("geocomb-web")
library gw;

import 'package:js/js.dart';
import 'dart:async';

import 'package:geocomb_flutter/geocomb_flutter.dart'
    show MapOrientation, RotationMethod;

@JS("Icosahedron")
class D_Icosahedron {
  external String get mo;
  external String get rm;
  external static bool get isReady;

  /// constructor
  external D_Icosahedron(
      [String mo = MapOrientation.ECEF, String rm = RotationMethod.gnomonic]);

  /// onReady constructor, returns Icosahedron when WebAssembly runtime ready
  external static Future<D_Icosahedron> onReady(
      [String mo = MapOrientation.ECEF, String rm = RotationMethod.gnomonic]);

  external D_Point3 pointFromCoords(double lat, double lon);

  external D_HashProperties hash(D_Point3, int res);

  external D_GPoint3 parseHash(D_HashProperties props);
}

@JS("Point3")
class D_Point3 {
  external D_Point3(double x, double y, double z,
      [int triNum = -1, bool isPC = false]);
  external double get x;
  external double get y;
  external double get z;
  external int get triNum;
  external bool get isPC;
}

@JS("GPoint3")
class D_GPoint3 {
  external D_GPoint3(double x, double y, double z, int res, int row, int col,
      String mo, String rm,
      [int triNum = -1, bool isPC = false]);
  external double get x;
  external double get y;
  external double get z;
  external int get triNum;
  external bool get isPC;
  external int get row;
  external int get col;
  external int get res;
  external String get rm;
  external String get mo;
}

@JS("HashProperties")
class D_HashProperties {
  external D_HashProperties(int res, int row, int col, String mo, String rm);
  external String get mo;
  external String get rm;
  external int get row;
  external int get col;
  external int get res;
}
