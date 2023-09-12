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
              labelPadding: EdgeInsets.symmetric(horizontal: 50),
              tabs: [
                Tab(
                  child: Text('Pagos recientes'),
                ),
                Tab(
                  child: Text('Todos los pagos'),
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
            child: Column(
              children: [
                Expanded(
                  child: ListView(shrinkWrap: true, children: [
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                  ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(shrinkWrap: true, children: [
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                    CardItem(context),
                  ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget CardItem(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ModalBottomSheet(context);
            });
      },
      child: Container(
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
          )),
    );
  }

  SizedBox ModalBottomSheet(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .85,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5.0,
              width: 60.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hoy 01:35 hrs',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Muestra este código en la caseta',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontFamily: 'Raleway',
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Image(
              image: AssetImage(Assets.QR_ICON_3),
            ),
          ),
          Text(
            'Total',
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontFamily: 'Raleway',
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'MXN \$180.00',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '{Nombre de caseta}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontFamily: 'Raleway',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
