import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:la_fitnesse/main.dart';

void main() {
  testWidgets('HomeScreen has AppBar, background color, and BottomNavigationBar', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the AppBar with title 'Homepage' is present.
    expect(find.text('Homepage'), findsOneWidget);

    // Verify that the background color is pink[100].
    final Container container = tester.widget(find.byType(Container));
    expect((container.decoration as BoxDecoration).color, Colors.pink[100]);

    // Verify that the BottomNavigationBar is present.
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify that the BottomNavigationBar contains the correct items.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
