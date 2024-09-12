import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(const CongratulationsApp());
}

class CongratulationsApp extends StatelessWidget {
  const CongratulationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('День Программиста'),
        ),
        body: const CongratulationsScreen(),
      ),
    );
  }
}

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                    child: Image.asset('assets/images/pngegg.png',
                        width: 500, height: 500),
                  ),
                   
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/misha.png',
                    width: 300,
                    height: 300,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Icon(
                    Icons.code,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'С Днём Программиста!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Поздравляю всех программистов!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/pngegg.png', width: 500, height: 500),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
