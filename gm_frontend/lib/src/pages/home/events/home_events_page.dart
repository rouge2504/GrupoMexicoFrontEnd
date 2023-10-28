import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';

class HomeEventPage extends StatelessWidget {
  const HomeEventPage({super.key});

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
          'Detalles del evento',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PartBottom(context),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Text("Sinopsis",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: const Color.fromRGBO(55, 55, 55, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
              ),
            )
          ]),
    );
  }

  Widget PartBottom(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.BACKGROUND_TEST_2), fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: EdgeInsets.only(top: 180),
        child: Column(
          children: [
            Text("LEYENDAS DE GUANUAJUATO",
                style: TextStyle(
                    fontFamily: 'FjallaOne',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20)),
            Text("Centro de convenciones de Guanajuato",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15)),
            Text("27 de Octubre 21:00 hrs",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
