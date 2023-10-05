import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';

class MenuAboutPage extends StatelessWidget {
  const MenuAboutPage({super.key});

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
            // con.pageController.jumpToPage(0);
          },
        )),
        actions: [
          Container(
              child: IconButton(
            icon: ImageIcon(
              AssetImage(Assets.CLOSE_OUTLINE),
              color: Theme.of(context).colorScheme.surface,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
        ],
        backgroundColor: Colors.white,
        title: Text(
          'Acerca de',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _imageLogo(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Versión 0.0.1',
                style: TextStyle(
                  color: Color.fromRGBO(55, 55, 55, 1),
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Copyright 2023 © Grupo México',
                style: TextStyle(
                  color: Color.fromRGBO(55, 55, 55, 1),
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  'Somos una empresa líder en producción de cobre, transporte de carga e infraestructura. ',
                  style: TextStyle(
                    color: Color.fromRGBO(55, 55, 55, 1),
                    fontFamily: 'Raleway',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text(
                  'Calificar aplicación',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }

  Widget _imageLogo() {
    return Center(
        child: Image(
      image: AssetImage(Assets.LOGO),
      width: 300,
    ));
  }

  Widget _backgroundCover() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.BACKGROUND_IMAGE),
          fit: BoxFit.cover,
        ),
      ),
      child: null /* add child content here */,
    );
  }
}
