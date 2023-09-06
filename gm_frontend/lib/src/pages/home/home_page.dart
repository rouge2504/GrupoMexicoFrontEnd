import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:gm_frontend/src/utils/state_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 152,
            width: 152,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: FloatingActionButton(
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
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
            enableFeedback: true,
            unselectedLabelStyle: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 12,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
            selectedLabelStyle: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 12,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
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
                  label: 'Radio'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.MENU_OUTLINE),
                  ),
                  label: 'Menu')
            ],
          ),
        ),
      ), //BottomBar(context),
      appBar: AppBarHome(context),
      body: Column(
        children: [
          Banner(context),
          ButtonPanic(context),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SosButton(context),
              SizedBox(
                width: 18,
              ),
              CautionButton(context),
            ],
          )
        ],
      ),
    );
  }

  Widget CautionButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(alignment: Alignment.center, children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromRGBO(255, 237, 237, 0.3),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 45,
                backgroundColor: Color.fromRGBO(242, 215, 215, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromRGBO(225, 167, 167, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromRGBO(225, 41, 41, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
            ]),
            Text(
              'Reportar \n incidente',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StateColors.CAUTION,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
              softWrap: false,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget SosButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(alignment: Alignment.center, children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromRGBO(255, 237, 237, 0.3),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 45,
                backgroundColor: Color.fromRGBO(242, 215, 215, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromRGBO(225, 167, 167, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromRGBO(225, 41, 41, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
            ]),
            Text(
              'Necesito \n ayuda',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StateColors.ALERT,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
              softWrap: false,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget ButtonPanic(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(alignment: Alignment.center, children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Color.fromRGBO(255, 237, 237, 0.3),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromRGBO(242, 215, 215, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 45,
                backgroundColor: Color.fromRGBO(225, 167, 167, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Color.fromRGBO(225, 41, 41, 1),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Text('No tengo frenos',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }

  Widget Banner(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.125,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.BACKGROUND_TEST), fit: BoxFit.fill),
            border: Border.all(
                width: 3, color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            onPressed: () {},
            child: Row(
              children: [
                EventIcon(context),
                SizedBox(
                  width: 10,
                ),
                BannerTextEvent(),
                Spacer(flex: 1),
                Container(
                  //alignment: Alignment.centerRight,
                  child: ImageIcon(
                    AssetImage(Assets.ARROW_LEFT_OUTLINE),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            )));
  }

  Widget BannerTextEvent() {
    return Expanded(
      flex: 6,
      child: Text(
        'LEYENDAS DE GUANUAJUATO',
        style: TextStyle(
            fontFamily: 'FjallaOne', color: Colors.white, fontSize: 20),
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget EventIcon(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Container(
              alignment: Alignment.center,
              child: ImageIcon(
                AssetImage(Assets.EVENT_OUTLINE),
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 24,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'EVENTOS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'FjallaOne',
                  color: Colors.white,
                ),
              ),
            ),
            decoration: new BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              //border: Border.all(color: Colors.black, width: 0.0),
              borderRadius: new BorderRadius.all(Radius.elliptical(100, 100)),
            ),
          ),
        ],
      ),
    );
  }

  AppBar AppBarHome(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: MediaQuery.of(context).size.height * 0.125,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      leading: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: ImageIcon(
          AssetImage(Assets.PIN),
          color: Theme.of(context).colorScheme.onSecondary,
          size: 100,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tramo',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 13,
              fontFamily: 'Raleway',
            ),
          ),
          Text(
            'Toluca, Atlacomulco, km 31',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Raleway',
            ),
          )
        ],
      ),
      actions: [
        ImageIcon(
          AssetImage(Assets.PROFILE_OUTLINE),
          color: Theme.of(context).colorScheme.surface,
          size: 100,
        ),
      ],
    );
  }

  BottomAppBar BottomBar(BuildContext context) {
    return BottomAppBar(
      shape: AutomaticNotchedShape(RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35)))),
      height: MediaQuery.of(context).size.height * 0.125,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    icon: ImageIcon(
                      AssetImage(Assets.HOME_OUTLINE_1),
                      color: Theme.of(context).colorScheme.surface,
                      size: 150,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Inicio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    icon: ImageIcon(
                      AssetImage(Assets.SEARCH_OUTLINE),
                      color: Theme.of(context).colorScheme.surface,
                      size: 150,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Destino',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    icon: ImageIcon(
                      AssetImage(Assets.MEDIA_OUTLINE_1),
                      color: Theme.of(context).colorScheme.surface,
                      size: 150,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Radio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    icon: ImageIcon(
                      AssetImage(Assets.MENU_OUTLINE),
                      color: Theme.of(context).colorScheme.surface,
                      size: 150,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
