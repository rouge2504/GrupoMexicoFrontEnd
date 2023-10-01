import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/home/menu/menu_side_controller.dart';

class MenuPage extends StatelessWidget {
  MenuSideController con = MenuSideController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatinActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarNavigatorBottom(context),
      appBar: AppBar(
        leading: Container(
            child: IconButton(
          icon: ImageIcon(
            AssetImage(Assets.BACK_ARROW),
            color: Theme.of(context).colorScheme.surface,
          ),
          onPressed: () {
            // Navigator.pop(context);
            con.GoToHome();
          },
        )),
        backgroundColor: Colors.white,
        title: Text(
          'Menú',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration:
                BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: Offset(0, 0.65),
              )
            ]),
            child: Container(
              child: Column(children: [
                ButtonItem(context, 'Mi perfil', Assets.PROFILE_OUTLINE,
                    con.GoToAccount),
                ButtonItem(
                    context, 'Mis vehiculos', Assets.CAR_ICON, con.GoToCar),
                ButtonItem(
                    context, 'Medios de Pago', Assets.MONEY_ICON, () => {}),
                ButtonItem(context, 'Historial de pagos',
                    Assets.MONEY_HISTORY_ICON, () => {}),
                ButtonItem(context, 'Notificaciones', Assets.NOTIFICATION_ICON,
                    () => {}),
                ButtonItem(
                    context, 'Sugerencias', Assets.SUGGESTION_ICON, () => {}),
                ButtonItem(context, 'Preguntas frecuentes', Assets.HELP_ICON,
                    () => {}),
              ]),
            ),
          ),
          LogOutButton(context),
        ],
      ),
    );
  }

  Widget LogOutButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            onPressed: () => con.PopUpWindow(context),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(Assets.LOG_OUT_ICON),
                  color: Theme.of(context).colorScheme.surface,
                  size: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Acerca de',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 18,
                    fontFamily: 'Raleway',
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget ButtonItem(
      BuildContext context, String text, String nameImage, Function function) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.085,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        onPressed: () {
          function();
        },
        child: Row(
          children: [
            ImageIcon(
              AssetImage(nameImage),
              color: Theme.of(context).colorScheme.surface,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 20,
                fontFamily: 'Raleway',
              ),
            ),
            Spacer(flex: 1),
            Container(
                //alignment: Alignment.centerRight,
                child: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.surface,
              size: 28,
            )),
          ],
        ),
      ),
    );
  }

  Widget NavBarNavigatorBottom(BuildContext context) {
    return Obx(() => Container(
          height: MediaQuery.of(context).size.height * 0.125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 35,
              elevation: 10,
              currentIndex: con.indexBottomPage.value,
              onTap: con.onTap,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.surface,
              /* unselectedLabelStyle: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 12,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
          selectedLabelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 12,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),*/
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(Assets.HOME_OUTLINE_1),
                    ),
                    label: 'Inicio'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(Assets.SEARCH_OUTLINE),
                    ),
                    label: 'Destino'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(Assets.HOME_OUTLINE_1),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    label: 'Inicio'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(Assets.MEDIA_OUTLINE_1),
                    ),
                    label: 'Media'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(Assets.MENU_OUTLINE),
                    ),
                    label: 'Menu')
              ],
            ),
          ),
        ));
  }

  Widget FloatinActionButton(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 152,
          width: 152,
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: FloatingActionButton(
              heroTag: 'btn_3',
              backgroundColor: Color.fromRGBO(255, 209, 211, 1),
              onPressed: () {
                // Respond to button press
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
        SizedBox(
          height: 140,
          width: 140,
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: FloatingActionButton(
              heroTag: 'btn_4',
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                // Respond to button press
              },
              child: Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.QR_ICON),
                  scale: 0.8,
                  fit: BoxFit.scaleDown,
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
