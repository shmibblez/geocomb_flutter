import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:geocomb_flutter/geocomb_bundle.dart';
import 'geocomb_flutter_web.dart';

/// A web implementation of the GeocombFlutter plugin.
class GeocombFlutterWeb {
  static bool _geocomb_inserted = false;

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'geocomb_flutter',
      const StandardMethodCodec(),
      registrar,
    );

    // // not sure if this gets called multiple times, so makes sure geocomb bundle only inserted once into html
    // if (!_geocomb_inserted) {
    //   _injectGecombBundle();
    //   _geocomb_inserted = true;
    // }

    importJsLibrary(url: "./assets/geocomb_bundle.js");

    final pluginInstance = GeocombFlutterWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  // static void _injectGecombBundle() {
  //   // importJsLibrary(url: "packages/geocomb_flutter/web/geocomb_bundle.js");

  //   final html.ScriptElement geocomb_bundle = html.ScriptElement()
  //     // ..src = "packages/geocomb_flutter/web/geocomb_bundle.js"
  //     ..type = "application/javascript"
  //     ..defer = true
  //     ..charset = "utf-8";

  //   final body = html.querySelector('html');
  //   // html.Document

  //   body.children.insert(0, geocomb_bundle);
  // }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
        break;
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'geocomb_flutter for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  /// Returns a [String] containing the version of the platform.
  Future<String> getPlatformVersion() {
    final version = html.window.navigator.userAgent;
    return Future.value(version);
  }
}
