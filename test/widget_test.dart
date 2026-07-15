import 'package:clipper/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AutoCropApp());
    expect(find.byType(AutoCropApp), findsOneWidget);
  });
}
