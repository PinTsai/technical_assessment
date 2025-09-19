import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_assessment/data/post_model.dart';
import 'package:technical_assessment/presentation/post_detail_screen.dart';
import 'package:technical_assessment/presentation/post_list_screen.dart';
import 'package:technical_assessment/providers/post_provider.dart';
import 'post_list_screen_test.mocks.dart';
import 'testable_widget.dart';   // generated file

void main() {
  late MockPostProvider mockProvider;

  setUp(() {
    mockProvider = MockPostProvider();

    when(mockProvider.loadPosts()).thenAnswer((_) async {});
  });

  group('PostListScreen widget test', () {
    testWidgets('shows a loader while state == loading',
            (tester) async {
          when(mockProvider.state).thenReturn(PostState.loading);

          await tester.pumpWidget(
            makeTestable(child: const PostListScreen(), provider: mockProvider),
          );

          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        });

    testWidgets('shows error UI and retry button calls loadPosts()',
            (tester) async {
          when(mockProvider.state).thenReturn(PostState.error);
          when(mockProvider.errorMessage).thenReturn('Server down');

          await tester.pumpWidget(
            makeTestable(child: const PostListScreen(), provider: mockProvider),
          );

          expect(find.text('Error loading posts'), findsOneWidget);
          expect(find.text('Server down'), findsOneWidget);

          await tester.tap(find.byIcon(Icons.refresh));
          verify(mockProvider.loadPosts()).called(2);
        });

    testWidgets('shows list when loaded and navigates on tap',
            (tester) async {
          final fakePosts = [
            Post(id: 1, userid: 1, title: 'Qoo', body: 'orange'),
            Post(id: 2, userid: 1, title: 'WaWa', body: 'need to go to vet'),
          ];

          when(mockProvider.state).thenReturn(PostState.loaded);
          when(mockProvider.posts).thenReturn(fakePosts);

          await tester.pumpWidget(
            makeTestable(child: const PostListScreen(), provider: mockProvider),
          );

          // Two list items should appear
          expect(find.text('Qoo'), findsOneWidget);
          expect(find.text('need to go to vet'), findsOneWidget);

          // Tap first item
          await tester.tap(find.text('orange'));
          await tester.pumpAndSettle();

          expect(find.byType(PostDetailScreen), findsOneWidget);
        });
  });
}