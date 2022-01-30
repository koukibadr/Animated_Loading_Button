import 'package:animated_loading_button/animated_loading_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedLoadingButton<void>(
          onPress: onPress,
          onAsyncCallFinished: (value){
            print('ali');
          },
        ),
      ),
    );
  }

  Future<void> onPress() async{
    await Future.delayed(const Duration(milliseconds: 4000));
  }
}