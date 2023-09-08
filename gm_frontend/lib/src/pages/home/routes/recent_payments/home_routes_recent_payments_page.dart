import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';

class HomeRoutesRecentPaymentsPage extends StatelessWidget {
  const HomeRoutesRecentPaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            child: IconButton(
          icon: ImageIcon(
            AssetImage(Assets.BACK_ARROW),
            color: Theme.of(context).colorScheme.surface,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        backgroundColor: Colors.white,
        title: Text(
          'Pagos recientes',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
