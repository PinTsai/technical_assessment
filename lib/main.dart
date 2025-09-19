import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_assessment/presentation/post_list_screen.dart';
import 'package:technical_assessment/providers/post_provider.dart';
import 'package:technical_assessment/services/postApi.dart';
import 'app_theme.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => PostProvider(PostApi(http.Client()))
          ),
        ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Assessment',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.mainColor)
      ),
      home: const PostListScreen(),
    );
  }
}

