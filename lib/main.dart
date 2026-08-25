import 'package:flutter/material.dart';

void main() {
  runApp(const Y2kVisionApp());
}

class Y2kVisionApp extends StatelessWidget {
  const Y2kVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Y2K Vision Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ColorTestScreen(),
    );
  }
}

class ColorTestScreen extends StatefulWidget {
  const ColorTestScreen({super.key});

  @override
  State<ColorTestScreen> createState() => _ColorTestScreenState();
}

class _ColorTestScreenState extends State<ColorTestScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _testColors = [
    {'name': 'الأحمر', 'color': Colors.red},
    {'name': 'الأخضر', 'color': Colors.green},
    {'name': 'الأزرق', 'color': Colors.blue},
    {'name': 'الأصفر', 'color': Colors.yellow},
    {'name': 'الأبيض', 'color': Colors.white},
  ];

  void _nextColor() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _testColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentColor = _testColors[_currentIndex];

    return Scaffold(
      backgroundColor: currentColor['color'],
      appBar: AppBar(
        title: const Text('فحص الألوان - Y2K'),
        centerTitle: true,
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
      ),
      body: InkWell(
        onTap: _nextColor,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'اللون الحالي: ${currentColor['name']}\n(اضغط للانتقال للون التالي)',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}