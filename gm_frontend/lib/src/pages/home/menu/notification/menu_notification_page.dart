import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';

class MenuNotificationPage extends StatelessWidget {
  const MenuNotificationPage({super.key});

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
          'Notificaciones',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _boxForm(context),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Container(
        //margin: EdgeInsets.all(1.0),
        //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
        width: double.infinity,
        padding: EdgeInsets.all(20.0),

        height: MediaQuery.of(context).size.height * 0.55,
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 0.5,
            offset: Offset(0, 0.50),
          )
        ]),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Permitir notificaciones de:',
              style: TextStyle(
                color: Color.fromRGBO(55, 55, 55, 1),
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchOption('Proxima caseta', (active) => true),
            SwitchOption('Recordatorios', (active) => true),
            SwitchOption('Proximos eventos', (active) => true),
            SwitchOption('Eventos cercanos', (active) => true),
          ],
        ),
      ),
    );
  }

  Padding SwitchOption(String title, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromRGBO(84, 88, 89, 1),
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              )),
          Expanded(
              child: Transform.scale(
            scale: .8,
            child: CupertinoSwitch(
              value: true,
              onChanged: onChanged,
              activeColor: Color.fromRGBO(1, 139, 56, 1),
            ),
          )),
        ],
      ),
    );
  }
}
