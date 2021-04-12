// import 'package:flutter/foundation.dart';

// import 'interop.dart';

// class MapOrientation {
//   static const ECEF = "ECEF";
//   static const dymaxion = "dymaxion";
// }

// class RotationMethod {
//   static const gnomonic = "gnomonic";
//   static const quaternion = "quaternion";
// }

// class Icosahedron {
//   // JsObject _ico = JsObject(context["Icosahedron"]);
//   // JsObject _p3 = JsObject(context["Point3"]);
//   // JsObject _gp3 = JsObject(context["GPoint3"]);
//   //
//   Icosahedron(String mo, String rm)
//       : assert(Icosahedron.isReady),
//         this._ico = new D_Icosahedron(mo, rm);

//   Icosahedron._fromD_Ico(D_Icosahedron ico) : this._ico = ico;

//   final D_Icosahedron _ico;

//   String get mo => this._ico.mo;
//   String get rm => this._ico.rm;
//   static bool get isReady => D_Icosahedron.isReady;

//   static Future<Icosahedron> onReady(String mo, String rm) async {
//     if (kIsWeb) {
//       final D_Icosahedron ico = await D_Icosahedron.onReady(mo, rm);
//       return new Icosahedron._fromD_Ico(ico);
//     } else {
//       throw UnimplementedError(
//           "Icosahedron.onReady() not ready yet, currently only available on web");
//     }
//   }

//   Point3 pointFromCoords(double lat, double lon) {
//     if (kIsWeb) {
//       final D_Point3 p3 = this._ico.pointFromCoords(lat, lon);
//       return new Point3._fromD_Point3(p3);
//     } else {
//       throw UnimplementedError(
//           "Icosahedron.pointFromCoords() not ready yet, currently only available on web");
//     }
//   }

//   HashProperties hash(Point3 p, int res) {
//     if (kIsWeb) {
//       final D_HashProperties hp = this._ico.hash(p._p, res);
//       return new HashProperties._fromD_HashProperties(hp);
//     } else {
//       throw UnimplementedError(
//           "Icosahedron.hash() not ready yet, currently only available on web");
//     }
//   }

//   GPoint3 parseHash(HashProperties props) {
//     if (kIsWeb) {
//       final D_GPoint3 hp = this._ico.parseHash(props._hp);
//       return new GPoint3._fromD_GPoint3(hp);
//     } else {
//       throw UnimplementedError(
//           "Icosahedron.hash() not ready yet, currently only available on web");
//     }
//   }
// }

// class Point3 {
//   Point3(double x, double y, double z, [int triNum = -1, bool isPC = false])
//       : this._p = new D_Point3(x, y, z, triNum, isPC);

//   Point3._fromD_Point3(D_Point3 p3) : this._p = p3;

//   final D_Point3 _p;

//   double get x => this._p.x;
//   double get y => this._p.y;
//   double get z => this._p.z;
//   int get triNum => this._p.triNum;
//   bool get isPC => this._p.isPC;
// }

// class GPoint3 {
//   GPoint3(double x, double y, double z, int res, int row, int col, String mo,
//       String rm,
//       [int triNum = -1, bool isPC = false])
//       : this._p = new D_GPoint3(x, y, z, res, row, col, mo, rm, triNum, isPC);

//   GPoint3._fromD_GPoint3(D_GPoint3 gp3) : this._p = gp3;

//   final D_GPoint3 _p;

//   double get x => this._p.x;
//   double get y => this._p.y;
//   double get z => this._p.z;

//   int get res => this._p.res;
//   int get row => this._p.row;
//   int get col => this._p.col;
//   String get rm => this._p.rm;
//   String get mo => this._p.mo;

//   int get triNum => this._p.triNum;
//   bool get isPC => this._p.isPC;
// }

// class HashProperties {
//   HashProperties(int res, int row, int col, String mo, String rm)
//       : this._hp = new D_HashProperties(res, row, col, mo, rm);

//   HashProperties._fromD_HashProperties(D_HashProperties hp) : this._hp = hp;

//   final D_HashProperties _hp;

//   String get mo => this._hp.mo;
//   String get rm => this._hp.rm;
//   int get row => this._hp.row;
//   int get col => this._hp.col;
//   int get res => this._hp.res;
// }

// // // old icosahedron code

// // // need this too:
// // import "dart:js";
// // import 'dart:js_util';

// // class Icosahedron {
// // JsObject _ico = JsObject(context["Icosahedron"]);
// // JsObject _p3 = JsObject(context["Point3"]);
// // JsObject _gp3 = JsObject(context["GPoint3"]);

// //   Icosahedron(String mo, String rm) {
// //     this._ico = JsObject(context["Icosahedron"], [mo, rm]);
// //   }

// //   Icosahedron._(JsObject ico) {}

// //   JsObject _ico;

// //   String get mo => this._ico["mo"];
// //   String get rm => this._ico["rm"];

// //   static Future<Icosahedron> onReady(String mo, String rm) async {
// //     if (kIsWeb) {
// //       final JsObject ico = JsObject(context["Icosahedron"], [mo, rm]);
// //       await promiseToFuture(ico.callMethod("onReady", [mo, rm]));
// //       return new Icosahedron(mo, rm);
// //     } else {
// //       throw UnimplementedError(
// //           "Icosahedron.onReady() not ready yet, currently only available on web");
// //     }
// //   }

// //   static Point3 pointFromCoords(double lat, double lon) {
// //     this._ico;
// //   }
// // }
