import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
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
    return Obx(() => Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 25),
                    child: con.pageIndex != 0
                        ? TextButton(
                            child: Text(
                              'Atras',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => con.BackPage(),
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, right: 25),
                    child: con.pageIndex != demo_data.length - 1
                        ? TextButton(
                            child: Text(
                              'Omitir',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => con.BackPage(),
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                pageContentForm(context),
                dotContent(context),
                buttonNext(context),
              ],
            )
          ],
        ));
  }

  Widget buttonNext(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.10,
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
            padding: EdgeInsets.symmetric(vertical: 20)),
        onPressed: () => con.NextPage(),
      ),
    );
  }

  Widget dotContent(BuildContext context) {
    return Obx(() => Container(
        height: MediaQuery.of(context).size.height * 0.10,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                demo_data.length,
                (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      child: con.pageIndex.value == index
                          ? CircleAvatar(
                              radius: 6,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            )
                          : Align(
                              child: Container(
                                height: 6,
                                width: 12,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                decoration: new BoxDecoration(
                                  color: index < con.pageIndex.value
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onSurface,
                                  border: Border.all(
                                      color: Colors.black, width: 0.0),
                                  borderRadius: new BorderRadius.all(
                                      Radius.elliptical(100, 100)),
                                ),
                              ),
                            ),
                    ))))));
  }

  Widget pageContentForm(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.64,
      child: PageView.builder(
          itemCount: demo_data.length,
          controller: con.pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) => con.onPageViewChange(index),
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
