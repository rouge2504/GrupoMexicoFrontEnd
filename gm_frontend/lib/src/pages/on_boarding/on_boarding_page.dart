import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              itemCount: demo_data.length,
              controller: _pageController,
              itemBuilder: (context, index) => OnBoardingContent(
                  title: demo_data[index].title,
                  description: demo_data[index].description)),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () => _pageController.nextPage(
                duration: Duration(microseconds: 30), curve: Curves.ease),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
            child: Text('Siguiente'),
          ),
        ),
      ],
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Spacer()
        ],
      )),
    );
  }
}

class Onboard {
  final String title, description;

  Onboard({
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
      title: "Paga desde tu celular",
      description:
          'Registra tu vehículo y cuando estés cerca de la próxima caseta, podrás pagar desde tu celular con tu medio de pago preferido.'),
  Onboard(
      title: "Checa esta madre",
      description:
          'Registra tu vehículo y cuando estés cerca de la próxima caseta, podrás pagar desde tu celular con tu medio de pago preferido.'),
  Onboard(
      title: "Paga desde tu celular",
      description:
          'Registra tu vehículo y cuando estés cerca de la próxima caseta, podrás pagar desde tu celular con tu medio de pago preferido.'),
];
