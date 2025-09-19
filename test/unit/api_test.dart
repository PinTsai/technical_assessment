import 'dart:convert';
import 'package:technical_assessment/data/post_model.dart';
import 'package:technical_assessment/services/postApi.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'api_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
  group('PostApi tests', () {
    late MockClient mockClient;
    late PostApi postApi;

    setUp(() {
      mockClient = MockClient();
      postApi = PostApi(mockClient);
    });

    group('getPosts', (){
      test("should return a list of posts when API request successful", () async {

        // Arrange
        final mockJson = jsonEncode( [
          {"userId": 1, "id": 1, "title": "Test Post 1", "body": "Hello world"},
          {"userId": 2, "id": 2, "title": "Test Post 2", "body": "Another post"}
        ]);
        
        when(mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: anyNamed("headers"),
        )).thenAnswer(
                (_) async =>
                    http.Response(mockJson, 200)
        );

        // Act
        final posts = await postApi.getPosts();

        // Assert
        expect(posts, isA<List<Post>>());
        expect(posts.length, 2);
        expect(posts[0].title, "Test Post 1");
        expect(posts[1].id, 2);
      });


      test('throws an exception if the http call completes with an error', () async {

        // Arrange
        when(mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: anyNamed("headers"),
        )).thenAnswer(
                (_) async =>
                http.Response('Not Found', 404)
        );

        // Act & Assert
        expect(
              () => postApi.getPosts(),
          throwsA(
            isA<Exception>().having(
                  (e) => e.toString(),
              'message',
              contains('HTTP 404'),
            ),
          ),
        );

      });


      test('throws an exception on network error', () async {

        // Arrange
        when(mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: anyNamed("headers"),
        )).thenThrow(
            Exception("Network issue")
        );


        // Act & Assert
        expect(
              () => postApi.getPosts(),
          throwsA(isA<Exception>()),
        );
      });

    });
    
    

  });

}