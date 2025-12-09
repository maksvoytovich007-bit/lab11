import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigModel with ChangeNotifier {

  double _width = 100.0;
  double _height = 100.0;
  double _radius = 0.0;

  double get width => _width;
  double get height => _height;
  double get radius => _radius;


  void setWidth(double newWidth) {
    _width = newWidth;
    notifyListeners();
  }

  void setHeight(double newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  void setRadius(double newRadius) {
    _radius = newRadius;
    notifyListeners();
  }
}

class SliderSection extends StatelessWidget {
  final String label;
  final double min;
  final double max;
  final double currentValue;
  final ValueChanged<double> onChanged;

  const SliderSection({super.key,
    required this.label,
    required this.min,
    required this.max,
    required this.currentValue,
    required this.onChanged,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ${currentValue.toStringAsFixed(2)}'),
          Slider(
            value: currentValue,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}



void main() {
  runApp(

    ChangeNotifierProvider(
      create: (context) => ConfigModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Configurator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ConfigurationScreen(),
    );
  }
}

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SliderSection(
              label: 'Width',
              min: 50.0,
              max: 200.0,
              currentValue: config.width,
              onChanged: config.setWidth,
            ),
            SliderSection(
              label: 'Height',
              min: 50.0,
              max: 200.0,
              currentValue: config.height,
              onChanged: config.setHeight,
            ),
            SliderSection(
              label: 'Radius',
              min: 0.0,
              max: 100.0,
              currentValue: config.radius,
              onChanged: config.setRadius,
            ),

            const SizedBox(height: 30),


            Center(
              child: Consumer<ConfigModel>(
                builder: (context, config, child) {
                  return Container(
                    width: config.width,
                    height: config.height,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(config.radius),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}