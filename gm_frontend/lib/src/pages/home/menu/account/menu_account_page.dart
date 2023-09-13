import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';

class MenuAccountPage extends StatefulWidget {
  const MenuAccountPage({super.key});

  @override
  State<MenuAccountPage> createState() => _MenuAccountPageState();
}

class _MenuAccountPageState extends State<MenuAccountPage> {
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
          'Mi perfil',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: PageView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15.0),
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration:
                      BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15,
                      offset: Offset(0, 0.50),
                    )
                  ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Image(
                            image: AssetImage(Assets.PROFILE_OUTLINE_1),
                            width: 80,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre ooooooooooooooooo',
                              style: TextStyle(
                                  color: const Color.fromRGBO(84, 88, 089, 1),
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Correo',
                              style: TextStyle(
                                  color: const Color.fromRGBO(84, 88, 089, 1),
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Numero celular',
                              style: TextStyle(
                                  color: const Color.fromRGBO(84, 88, 089, 1),
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).colorScheme.surface,
                        size: 28,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
