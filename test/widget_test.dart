import 'package:flutter_test/flutter_test.dart';
import 'package:golden_hour/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const GoldenHourApp());
    await tester.pumpAndSettle();

    expect(find.byType(Object), findsWidgets);
  });
}