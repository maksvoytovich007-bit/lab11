import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/config_provider.dart'; // Імпорт ConfigModel

class RedContainerPreview extends StatelessWidget {
  const RedContainerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Consumer прослуховує зміни в ConfigModel і перебудовує лише цей контейнер
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
    );
  }
}