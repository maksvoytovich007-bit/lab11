import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/config_provider.dart'; // Імпортуємо ConfigModel
import 'widgets/sliders_sections.dart'; // Імпортуємо файл, що містить SlidersWidget
import 'widgets/red_container_preview.dart';

class V1 extends StatelessWidget {
  const V1({super.key});

  @override
  Widget build(BuildContext context) {
    // Тут ми обгортаємо наш вміст у ChangeNotifierProvider.
    // Зверніть увагу: я виправив `ConfigProvider()` на `ConfigModel()` відповідно до назви вашого класу.
    return ChangeNotifierProvider(
      create: (_) => ConfigModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 20),

              SlidersWidget(),
              SizedBox(height: 30),
              RedContainerPreview(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}