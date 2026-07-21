# Flutter Product Studio

Flutter Product Studio is the deterministic mobile showcase for Flutter Design Engineer. It uses local Aurora project fixtures to demonstrate the connected workflow from product audit through release readiness.

## Screens

1. Workspace
2. AI Audit
3. Design System
4. Adaptive Preview
5. Visual QA
6. Release

The application also includes loading, empty, and recoverable error fixtures. It does not call a live AI service or backend.

## Run

```sh
cd examples/product-studio/demo
flutter pub get
flutter run
```

## Verify

```sh
flutter analyze
flutter test
flutter test --update-goldens test/product_studio_golden_test.dart
```

Golden images are committed under `demo/goldens/` and are used by the public website as rendered evidence.
