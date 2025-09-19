import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_assessment/data/post_model.dart';
import 'package:technical_assessment/presentation/post_detail_screen.dart';

void main() {
  testWidgets('shows post detail', (tester) async {

    // Arrange
    final post = Post(
        id: 1,
        userid: 1,
        title: 'Good',
        body: 'Test'
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PostDetailScreen(
          post: post
        ),
      ),
    );

    // Assert
    expect(find.text('Post ID: 1'), findsOneWidget);
    expect(find.text('User ID: 1'), findsOneWidget);
    expect(find.text('Good'), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);


  }
  );
}
