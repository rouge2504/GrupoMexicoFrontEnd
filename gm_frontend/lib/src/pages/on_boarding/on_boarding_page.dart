import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:gm_frontend/src/pages/on_boarding/on_boarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingController con = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [pageForm(context)]),
    );
  }

  Widget pageForm(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 25),
              child: Text(
                'Atrás',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 50, right: 25),
              child: Text(
                'Omitir',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            pageContentForm(),
            dotContent(context),
            buttonNext(),
          ],
        )
      ],
    );
  }

  Widget buttonNext() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        child: Text('Siguiente',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(vertical: 15)),
        onPressed: () => con.NextPage(),
      ),
    );
  }

  Widget dotContent(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                3,
                (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                        child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ))))));
  }

  Widget pageContentForm() {
    return SizedBox(
      height: 500,
      child: PageView.builder(
          itemCount: demo_data.length,
          controller: con.pageController,
          itemBuilder: (context, index) => OnBoardingContent(
              title: demo_data[index].title,
              image: demo_data[index].image,
              description: demo_data[index].description)),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image(
          image: AssetImage(image),
          width: 300,
        )),
        Text(title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Text(
            description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Raleway',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class Onboard {
  final String title, description, image;

  Onboard({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<Onboard> demo_data = [
  Onboard(
      title: "Paga desde tu celular",
      image: Assets.ON_BOARDING_IMAGE_1,
      description:
          'Registra tu vehículo y cuando estés cerca de la próxima caseta, podrás pagar desde tu celular con tu medio de pago preferido.'),
  Onboard(
      title: 'Recibe auxilio en emergencias',
      image: Assets.ON_BOARDING_IMAGE_2,
      description:
          'Genera llamadas de auxilio en caso de emergencia propia o por algún incidente que se presente a lo largo de tu recorrido.'),
  Onboard(
      title: "Conoce datos del trayecto",
      image: Assets.ON_BOARDING_IMAGE_3,
      description:
          'Consulta datos importantes como eventos cercanos, trayectos a casetas, gasolineras y áreas de servicio.'),
];
