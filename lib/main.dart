import 'package:flutter/material.dart';
import 'package:image_text_verify/controller/provider_data.dart';
import 'package:image_text_verify/controller/text_provider.dart';
import 'package:image_text_verify/view/home_screen.dart';
import 'package:image_text_verify/view/widgets/const_colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ImageDataProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => TextProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:purpleColor),
      home: const HomeScreen(),
    );
  }
}
