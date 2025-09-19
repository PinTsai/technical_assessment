
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_assessment/data/post_model.dart';

void main() {
  group("Post Model Tests", () {
    test("should create Post from JSON correctly", () {

      // Arrange
      final json = {
        "id": 1,
        "userId": 10,
        "title": "Test Title",
        "body": "Test Body",
      };

      // Act
      final post = Post.fromJson(json);

      //Assert
      expect(post.id, 1);
      expect(post.userid, 10);
      expect(post.title, "Test Title");
      expect(post.body, "Test Body");
    });

    test("should handle missing fields", () {

      // Arrange
      final json = {
        'id': 1,
        'userId': 10,
      };
      
      expect(
          () => Post.fromJson(json),
          throwsA(isA<TypeError>()),
      );

    });

  });
}