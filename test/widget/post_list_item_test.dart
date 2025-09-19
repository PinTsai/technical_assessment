
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_assessment/data/post_model.dart';
import 'package:technical_assessment/presentation/posts_list_item.dart';


void main() {
  testWidgets('shows title & body', (tester) async {
    // Arrange
    final post = Post(
      id: 1,
      userid: 1,
      title: 'Good',
      body: 'Test'
    );

    await tester.pumpWidget(
      MaterialApp(
        home: PostsListItem(
          post: post,
          onTap: () {},
        ),
      ),
    );

    // Assert
    expect(find.text('Good'), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);
  });
}