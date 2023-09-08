import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';

class HomeRoutesRecentPaymentsPage extends StatelessWidget {
  const HomeRoutesRecentPaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Theme.of(context).colorScheme.surface,
              labelColor: Theme.of(context).colorScheme.primary,
              tabs: [
                Tab(
                  child: Text('Hoy'),
                ),
                Tab(
                  child: Text('Todo el historial'),
                )
              ],
            ),
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
              'Pagos recientes',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              CardItem(context),
              CardItem(context),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              CardItem(context),
              CardItem(context),
            ]),
          ),
        ]),
      ),
    );
  }

  Container CardItem(BuildContext context) {
    return Container(
        height: 100,
        child: Card(
          elevation: 9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 8, left: 30),
                  child: Text(
                    'XX:XX {am} hrs',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  )),
              ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 25, 10),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 12,
                        child: Text(
                          '{Nombre de caseta}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(flex: 1),
                      Text(
                        '{X.XX}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  //subtitle: Text('Burns'),
                  leading: ImageIcon(
                    AssetImage(Assets.QR_ICON_2),
                    size: 70,
                    color: Colors.black,
                  )),
            ],
          ),
        ));
  }
}
