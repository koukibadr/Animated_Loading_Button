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
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedLoadingButton<void>.iconRotation(
              buttonText: const Text('Login'),
              buttonIcon: const Icon(Icons.logout_outlined),
              onPress: onPress,
              onAsyncCallFinished: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedLoadingButton<void>.colorChangingButton(
              buttonChild: Row(
                children: const [
                  Icon(Icons.login),
                  Text('Login')
                ],
              ),
              colors: const [
                Colors.blue,
                Colors.cyan,
                Colors.black
              ],
              onPress: onPress,
              onAsyncCallFinished: (value) {},
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPress() async {
    await Future.delayed(
      const Duration(
        milliseconds: 4000,
      ),
    );
  }
}
