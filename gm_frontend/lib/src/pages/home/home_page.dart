import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';

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
      bottomNavigationBar: BottomBar(context),
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
