import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it_starter/model.dart';
import 'package:provider/provider.dart';

import 'screen.dart';

void main() {
  // 1. 사용 하고자 하는 위젯의 상위 위젯에 Provider를 추가
  runApp(
      // value 방식은 이미 생성된 객체를 공유할 때 사용
      // Provider.value(
      //     value: null,
      //     child: const CounterApp(),
      // )
      // create 방식은 객체를 새로 생성할 때 사용
      // Provider(
      //     create: (context) => CounterModel(),
      //     child: Provider(
      //         create: (context) => CounterModeModel(), //-> 등록 해야할 객체가 많아질 수록 위젯 트리가 복잡해짐
      //         child: const CounterApp()
      //     ),
      // )
      MultiProvider(
          providers: [
            Provider(
              create: (context) => CounterModel(),
            ),
            Provider(
              create: (context) => CounterModeModel(),
            )
          ],
        child: const CounterApp(),
      )
  );
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}