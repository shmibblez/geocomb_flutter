# geocomb_flutter
geocomb implementation but in flutter, this time it's personal

## project structure
- android & ios will use dart::ffi with geocomb-c, and web will use node package geocomb-web which relies on WebAssembly
- this means, other than some files, no need for method channels, which should mean speed
- "some files" mentioned above are c setup files for compiling c code on app build, but that should be it.
- this package won't be federated for now, but could be in the future since switch shouldn't be too complicated

# project status (where left off)
- need to start from 0, nothing new here -- Actually, everything will be new.

<del>

## project structure
- implementation is closely related to geocomb-web version (WebAssembly npm package implementation)
- flutter side has Icosahedron obj that has functions & stores icosahedron info
  - need to wait for platform specific implementations to be ready, so have onReady, & for each platform have function that returns bool when ready: notifyReady
- platform-specific implementations all have static functions that get passed MapOrientation & RotationMethod & do stuff that way
  - this will be useful for c implementations (dart:ffi), but might be a bit inefficient for web implementation since need to create obj for each operation
  - this also means 

## project status (where left off)
- need to hook up lib/geocomb_flutter.dart with geocomb-web
  - need to add geocomb-web js files (index.js & emscripten output) & add additional file with static js calls for geocomb-web files for calling from dart (since can only call static functions)

</del>

<!-- A new flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# geocomb_flutter
