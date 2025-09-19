import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_assessment/providers/post_provider.dart';


// Helper for fulfill the tester receive MaterialApp and Provider
Widget makeTestable({
  required Widget child,
  required PostProvider provider,
}) {
  return ChangeNotifierProvider<PostProvider>.value(
    value: provider,
    child: MaterialApp(home: child),
  );
}