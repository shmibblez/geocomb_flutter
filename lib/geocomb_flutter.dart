import 'package:flutter/foundation.dart';
import 'package:geocomb_flutter/web_interop.dart';

class MapOrientation {
  static const ECEF = "ECEF";
  static const dymaxion = "dymaxion";
}

class RotationMethod {
  static const gnomonic = "gnomonic";
  static const quaternion = "quaternion";
}

class Icosahedron {
  Icosahedron(String mo, String rm)
      : assert(Icosahedron.isReady),
        this._ico = new D_Icosahedron(mo, rm);

  Icosahedron._fromD_Ico(D_Icosahedron ico) : this._ico = ico;

  final D_Icosahedron _ico;

  String get mo => this._ico.mo;
  String get rm => this._ico.rm;
  static bool get isReady => D_Icosahedron.isReady;

  static Future<Icosahedron> onReady(String mo, String rm) async {
    if (kIsWeb) {
      final D_Icosahedron ico = await D_Icosahedron.onReady(mo, rm);
      return new Icosahedron._fromD_Ico(ico);
    } else {
      throw UnimplementedError(
          "Icosahedron.onReady() not ready yet, currently only available on web");
    }
  }

  Point3 pointFromCoords(double lat, double lon) {
    if (kIsWeb) {
      final D_Point3 p3 = this._ico.pointFromCoords(lat, lon);
      return new Point3._fromD_Point3(p3);
    } else {
      throw UnimplementedError(
          "Icosahedron.pointFromCoords() not ready yet, currently only available on web");
    }
  }

  HashProperties hash(Point3 p, int res) {
    if (kIsWeb) {
      final D_HashProperties hp = this._ico.hash(p._p, res);
      return new HashProperties._fromD_HashProperties(hp);
    } else {
      throw UnimplementedError(
          "Icosahedron.hash() not ready yet, currently only available on web");
    }
  }

  GPoint3 parseHash(HashProperties props) {
    if (kIsWeb) {
      final D_GPoint3 hp = this._ico.parseHash(props._hp);
      return new GPoint3._fromD_GPoint3(hp);
    } else {
      throw UnimplementedError(
          "Icosahedron.hash() not ready yet, currently only available on web");
    }
  }
}

class Point3 {
  Point3(double x, double y, double z, [int triNum = -1, bool isPC = false])
      : this._p = new D_Point3(x, y, z, triNum, isPC);

  Point3._fromD_Point3(D_Point3 p3) : this._p = p3;

  final D_Point3 _p;

  double get x => this._p.x;
  double get y => this._p.y;
  double get z => this._p.z;
  int get triNum => this._p.triNum;
  bool get isPC => this._p.isPC;
}

class GPoint3 {
  GPoint3(double x, double y, double z, int res, int row, int col, String mo,
      String rm,
      [int triNum = -1, bool isPC = false])
      : this._p = new D_GPoint3(x, y, z, res, row, col, mo, rm, triNum, isPC);

  GPoint3._fromD_GPoint3(D_GPoint3 gp3) : this._p = gp3;

  final D_GPoint3 _p;

  double get x => this._p.x;
  double get y => this._p.y;
  double get z => this._p.z;

  int get res => this._p.res;
  int get row => this._p.row;
  int get col => this._p.col;
  String get rm => this._p.rm;
  String get mo => this._p.mo;

  int get triNum => this._p.triNum;
  bool get isPC => this._p.isPC;
}

class HashProperties {
  HashProperties(int res, int row, int col, String mo, String rm)
      : this._hp = new D_HashProperties(res, row, col, mo, rm);

  HashProperties._fromD_HashProperties(D_HashProperties hp) : this._hp = hp;

  final D_HashProperties _hp;

  String get mo => this._hp.mo;
  String get rm => this._hp.rm;
  int get row => this._hp.row;
  int get col => this._hp.col;
  int get res => this._hp.res;
}

// // old icosahedron code

// // need this too:
// import "dart:js";
// import 'dart:js_util';

// class Icosahedron {
// JsObject _ico = JsObject(context["Icosahedron"]);
// JsObject _p3 = JsObject(context["Point3"]);
// JsObject _gp3 = JsObject(context["GPoint3"]);

//   Icosahedron(String mo, String rm) {
//     this._ico = JsObject(context["Icosahedron"], [mo, rm]);
//   }

//   Icosahedron._(JsObject ico) {}

//   JsObject _ico;

//   String get mo => this._ico["mo"];
//   String get rm => this._ico["rm"];

//   static Future<Icosahedron> onReady(String mo, String rm) async {
//     if (kIsWeb) {
//       final JsObject ico = JsObject(context["Icosahedron"], [mo, rm]);
//       await promiseToFuture(ico.callMethod("onReady", [mo, rm]));
//       return new Icosahedron(mo, rm);
//     } else {
//       throw UnimplementedError(
//           "Icosahedron.onReady() not ready yet, currently only available on web");
//     }
//   }

//   static Point3 pointFromCoords(double lat, double lon) {
//     this._ico;
//   }
// }

// // old code

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// /// used to be called GeocombFlutter, probably better but Icosahedron follows geocomb pattern (Icosahedron is main class/object in other implementations: geocomb-cpp, geocomb-node, & geocomb-web)
// class Icosahedron {
//   Icosahedron({this.mo, this.rm});
//   final MapOrientation mo;
//   final RotationMethod rm;

//   static const MethodChannel _channel = const MethodChannel('geocomb_flutter');

//   static Future<String> get platformVersion async {
//     final String version = await _channel.invokeMethod('getPlatformVersion');
//     return version;
//   }

//   /// returns whether plugin is ready
//   ///
//   /// pretty much only applies to web version since it relies on WebAssembly which has setup time
//   Future<bool> get isReady {
//     return _channel.invokeMethod("Icosahedron_isReady");
//   }

//   /// returns an Icosahedron obj when plugin is ready
//   Future<Icosahedron> onReady(
//       {@required RotationMethod rm, @required MapOrientation mo}) async {
//     // final Map<String, String> params = {
//     //   "mo": mo == MapOrientation.dymaxion ? "dymaxion" : "ECEF",
//     //   "rm": rm == RotationMethod.quaternion ? "quaternion" : "gnomonic",
//     // };
//     final bool ready = await _channel.invokeMethod("Icosahedron_notifyReady");
//     if (ready) {
//       // cool
//     } else {
//       throw new Exception(
//           "need to wait for plugin to be ready, see docs on how to create Icosahedron obj (geocomb-flutter)");
//     }
//     return Icosahedron(mo: mo, rm: rm);
//   }

//   ///
//   Future<Point3> pointFromCoords(
//       {@required double lat, @required double lon}) async {
//     // prepare params
//     final Map<String, dynamic> params = {
//       "mo": mo == MapOrientation.dymaxion ? "dymaxion" : "ECEF",
//       "rm": rm == RotationMethod.quaternion ? "quaternion" : "gnomonic",
//       "lat": lat,
//       "lon": lon,
//     };
//     // get result
//     final result =
//         await _channel.invokeMapMethod("Icosahedron_pointFromCoords", params);
//     // convert to Point3
//     return Point3(
//       x: result["x"],
//       y: result["y"],
//       z: result["z"],
//       triNum: result["triNum"],
//       isPC: result["isPC"],
//     );
//   }

//   Future<HashProperties> hash({@required Point3 p, @required int res}) async {
//     // prepare params
//     final Map<String, dynamic> params = {
//       "mo": mo == MapOrientation.dymaxion ? "dymaxion" : "ECEF",
//       "rm": rm == RotationMethod.quaternion ? "quaternion" : "gnomonic",
//       "p": {
//         "x": p.x,
//         "y": p.y,
//         "z": p.z,
//         "triNum": p.triNum,
//         "isPC": p.isPC,
//       },
//       "res": res,
//     };
//     // get result
//     final result = await _channel.invokeMapMethod("Icosahedron_hash", params);
//     // convert result to hash props
//     return HashProperties(
//       row: result["row"],
//       col: result["col"],
//       res: result["res"],
//       mo: result["mo"] == "dymaxion"
//           ? MapOrientation.dymaxion
//           : MapOrientation.ECEF,
//       rm: result["rm"] == "quaternion"
//           ? RotationMethod.quaternion
//           : RotationMethod.gnomonic,
//     );
//   }

//   Future<GPoint3> parseHash(HashProperties props) async {
//     // prepare params
//     final Map<String, dynamic> params = {
//       "row": props.row,
//       "col": props.col,
//       "res": props.res,
//       "mo": props.mo == MapOrientation.dymaxion ? "dymaxion" : "ECEF",
//       "rm": props.rm == RotationMethod.quaternion ? "quaternion" : "gnomonic",
//     };
//     // get result
//     final result =
//         await _channel.invokeMapMethod("Icosahedron_parseHash", params);
//     // convert result to GPoint3
//     return GPoint3(
//       x: result["x"],
//       y: result["y"],
//       z: result["z"],
//       triNum: result["triNum"],
//       isPC: result["isPC"],
//       row: result["row"],
//       col: result["col"],
//       res: result["res"],
//       mo: result["mo"] == "dymaxion"
//           ? MapOrientation.dymaxion
//           : MapOrientation.ECEF,
//       rm: result["rm"] == "quaternion"
//           ? RotationMethod.quaternion
//           : RotationMethod.gnomonic,
//     );
//   }
// }

// enum MapOrientation { ECEF, dymaxion }

// enum RotationMethod { gnomonic, quaternion }

// class HashProperties {
//   HashProperties({
//     @required this.row,
//     @required this.col,
//     @required this.res,
//     @required this.mo,
//     @required this.rm,
//   });
//   final int row;
//   final int col;
//   final int res;
//   final MapOrientation mo;
//   final RotationMethod rm;
// }

// class Point3 {
//   Point3({
//     @required this.x,
//     @required this.y,
//     @required this.z,
//     this.triNum = -1,
//     this.isPC = false,
//   });
//   double x;
//   double y;
//   double z;
//   int triNum;
//   bool isPC;
// }

// class GPoint3 extends Point3 {
//   GPoint3({
//     @required double x,
//     @required double y,
//     @required double z,
//     int triNum = -1,
//     bool isPC = false,
//     @required this.row,
//     @required this.col,
//     @required this.res,
//     @required this.mo,
//     @required this.rm,
//   }) : super(x: x, y: y, z: z, triNum: triNum, isPC: isPC);
//   final int row;
//   final int col;
//   final int res;
//   final MapOrientation mo;
//   final RotationMethod rm;
// }
