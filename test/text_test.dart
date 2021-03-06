import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {

  Directionality getDirectionalityWidget({Widget child}) => Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      );

  testWidgets('text used on String creates a Text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      getDirectionalityWidget(
        child: 'VelocityX'.text.make(),
      ),
    );

    expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).data,
        'VelocityX',
    );
  });

  testWidgets('Text widget responds to Font Scale', (WidgetTester tester) async {
    await tester.pumpWidget(
      getDirectionalityWidget(
        child: 'VelocityX'.text.xs.make(),
      ),
    );

    // Scale Factor for xs is 0.75
    expect(
      tester.widget<AutoSizeText>(find.byType(AutoSizeText)).textScaleFactor,
      0.75,
    );
  });

  testWidgets('Text widget responds to fontSize', (WidgetTester tester) async {
    await tester.pumpWidget(
      getDirectionalityWidget(
        child: "VelocityX".text.size(24).make(),
      ),
    );

    expect(
      tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.fontSize,
      24,
    );
  });

  testWidgets('Text widget responds to FontWeight', (WidgetTester tester) async {
    await tester.pumpWidget(
      getDirectionalityWidget(
        child: 'VelocityX'.text.medium.make(),
      ),
    );

    // Font Weight for medium is 500
    expect(
      tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.fontWeight,
      FontWeight.w500,
    );
  });
  
  testWidgets('Text widget responds to FontStyle', (WidgetTester tester) async {
    await tester.pumpWidget(
      getDirectionalityWidget(
        child: 'VelocityX'.text.italic.make()
      )
    );

    expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.fontStyle,
        FontStyle.italic,
    );
  });

  testWidgets('Text widget responds to alignment', (WidgetTester tester) async {
    await tester.pumpWidget(
      getDirectionalityWidget(
        child: 'VelocityX'.text.start.make()
      )
    );
    
    expect(
      tester.widget<AutoSizeText>(find.byType(AutoSizeText)).textAlign,
      TextAlign.start
    );
  });
  
  testWidgets('Text widget responds to letter spacing', (WidgetTester tester) async {
    await tester.pumpWidget(
      getDirectionalityWidget(
        child: 'VelocityX'.text.tightest.make()
      )
    );

    expect(
      tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.letterSpacing,
      -3.0
    );
  });

  testWidgets('Text widget responds to custom letter spacing', (WidgetTester tester) async {
    await tester.pumpWidget(
        getDirectionalityWidget(
            child: 'VelocityX'.text.letterSpacing(4.0).make()
        )
    );

    expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.letterSpacing,
        4.0
    );
  });

  testWidgets('Text widget responds to TextDecoration', (WidgetTester tester) async {
    await tester.pumpWidget(
        getDirectionalityWidget(
            child: 'VelocityX'.text.underline.make()
        )
    );

    expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.decoration,
        TextDecoration.underline
    );
  });

  testWidgets('Text widget responds to line height', (WidgetTester tester) async {
    await tester.pumpWidget(
        getDirectionalityWidget(
            child: 'VelocityX'.text.heightSnug.make()
        )
    );

    // Line Height or heightSnug is 0.875
    expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.height,
        0.875
    );
  });

  testWidgets('Text widget responds to text utilities', (WidgetTester tester) async {
    await tester.pumpWidget(
        getDirectionalityWidget(
            child: 'VelocityX'.text.uppercase.make()
        )
    );

    expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).data,
        'VELOCITYX'
    );
  });

  testWidgets('key is properly assigned', (WidgetTester tester) async {
    await tester.pumpWidget(
        getDirectionalityWidget(
            child: 'VelocityX'.text.uppercase.make(key: const Key("key"))
        )
    );

    expect(
        tester.widget(find.byKey(const Key('key'))).runtimeType,
        AutoSizeText
    );
  });

  testWidgets('Text widget responds to color', (WidgetTester tester) async {
    await tester.pumpWidget(
        getDirectionalityWidget(
            child: 'VelocityX'.text.red300.make()
        )
    );

    expect(
        tester.widget<AutoSizeText>(find.byType(AutoSizeText)).style.color,
        VelocityX.red300
    );
  });
}
