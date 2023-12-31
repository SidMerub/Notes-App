

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicenotesapp/provider/Deleteprovider.dart';
import 'package:voicenotesapp/provider/favourite_provider.dart';
import 'package:voicenotesapp/screens/introscreen.dart';











void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>FavouriteItemProvider()),
      ChangeNotifierProvider(create: (context)=>NotesProvider()),

    ],
      child: const MyApp()));
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home:IntroScreen()
    );
  }
}


