import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/config_provider.dart'; // Імпорт ConfigModel

// 1. Віджет для одного слайдера (як у вашому оригіналі)
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
          // Використовуємо Consumer тут, щоб оновлювати лише текст, коли значення змінюється
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


// 2. Віджет, який об'єднує всі слайдери (для використання в ConfigurationScreen або V1)
class SlidersWidget extends StatelessWidget {
  const SlidersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Використовуємо Provider.of для доступу до методів set (які не викликають перебудови)
    final config = Provider.of<ConfigModel>(context, listen: false);

    // Використовуємо Consumer для отримання актуальних значень, які відображаються у слайдерах
    return Consumer<ConfigModel>(
        builder: (context, configProvider, child) {
          return Column(
            children: [
              SliderSection(
                label: 'Width',
                min: 50.0,
                max: 200.0,
                currentValue: configProvider.width,
                onChanged: config.setWidth,
              ),
              SliderSection(
                label: 'Height',
                min: 50.0,
                max: 200.0,
                currentValue: configProvider.height,
                onChanged: config.setHeight,
              ),
              SliderSection(
                label: 'Radius',
                min: 0.0,
                max: 100.0,
                currentValue: configProvider.radius,
                onChanged: config.setRadius,
              ),
            ],
          );
        }
    );
  }
}