import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sashroy/helpers/di.dart';
import 'package:sashroy/main.dart';

void main() {
  setUpAll(() async {
    // Mocking path_provider for GetStorage during tests
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    const pathProviderCe = MethodChannel('plugins.flutter.io/path_provider_ce');
    const pathProvider = MethodChannel('plugins.flutter.io/path_provider');

    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      pathProviderCe,
      (MethodCall methodCall) async => '.',
    );
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      pathProvider,
      (MethodCall methodCall) async => '.',
    );

    // Initialize GetStorage and DI
    await GetStorage.init();
    diSetup();
  });

  tearDownAll(() async {
    await GetIt.instance.reset();
  });

  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Allow async init/timers in Loading + setInitValue() to complete.
    await tester.pump(const Duration(seconds: 3));

    // Login screen should be visible after Loading completes.
    expect(find.text('Welcome Back'), findsOneWidget);
  });
}
