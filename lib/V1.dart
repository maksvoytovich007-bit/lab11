import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/config_provider.dart';
import 'widgets/sliders_sections.dart';
import 'widgets/red_container_preview.dart';

class V1 extends StatelessWidget {
  const V1({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConfigModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Shape Configurator')),
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