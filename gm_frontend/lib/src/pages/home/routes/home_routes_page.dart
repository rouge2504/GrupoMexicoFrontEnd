import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/home/routes/home_routes_controller.dart';

class HomeRoutesPage extends StatelessWidget {
  HomeRoutesController con = HomeRoutesController();

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
            //Navigator.pop(context);
            con.GoToHome();
          },
        )),
        backgroundColor: Colors.white,
        title: Text(
          'Destino',
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
            height: MediaQuery.of(context).size.height * 0.75,
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
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                    'Encuentra lo que necesites cerca de ti:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ButtonItem(context, 'Casetas de cobro', Assets.TOOLTOOTH_ICON,
                    con.GoToTollboths),
                ButtonItem(context, 'Gasolineras', Assets.GAS_ICON,
                    con.GoToGasStation),
                ButtonItem(context, 'Áreas de servicio',
                    Assets.SERVICE_STATION_ICON, con.GoToServicesArea),
                // ButtonItem(context, 'Eventos', Assets.EVENT_OUTLINE, () => {}),
              ]),
            ),
          ),
        ],
      ),
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
              heroTag: 'btn_6',
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
              heroTag: 'btn_5',
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
