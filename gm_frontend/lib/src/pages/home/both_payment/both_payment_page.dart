import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/models/CardModel.dart';
import 'package:gm_frontend/src/models/mercado_pago_card_reference.dart';
import 'package:gm_frontend/src/pages/home/both_payment/both_payment_controller.dart';
import 'package:gm_frontend/src/pages/qr/qr_generator/qr_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BothPaymentPage extends StatelessWidget {
  BothPaymentController con = BothPaymentController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: buttonBack(context),
            title: Text('Pago de caseta',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white,
            actions: [
              _counterPage(context),
            ],
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: con.pageController,
            onPageChanged: (index) => con.onPageViewChange,
            children: [
              _pageForm1(context),
              _pageForm2(context),
            ],
          ),
        ));
  }

  Widget _pageForm1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        priceContent(context),
        titleCreditCard(),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: con.cars.length,
            itemBuilder: (_, index) {
              return CarCard(context, con.cars[index]);
            },
          ),
        ),
        //_boxForm(context),
        //_buttonNext(context),
      ],
    );
  }

  Widget _pageForm2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        priceContent(context),
        carChoosed(context),
        titleCard(),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: con.cardLength.value,
            itemBuilder: (_, index) {
              print('Index methods: ${index}');
              return cardCreditCard(context, con.creditCards[index]);
            },
          ),
        ),
        Row(
          children: [
            Checkbox(value: false, onChanged: (bool) {}),
            Flexible(
              child: Text(
                'Mantener esta configuración de pago para todas las casetas de mi viaje actual.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    con.PayButton();
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return ModalBottomSheet(context);
                        });
                  },
                  child: Text('Pagar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600)))),
        )
        //_boxForm(context),
        //_buttonNext(context),
      ],
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
            child: QrImageView(data: con.payQR.value),
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

  Container cardCreditCard(
      BuildContext context, MercadoPagoCardReference card) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(5),
        elevation: 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(Assets.CAR_ICON),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text('Tarjeta terminada en ${card.lastFourDigits}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Banco Santander Serfin S.A. Institución De Banca Múltiple',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400),
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container carChoosed(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(5),
        elevation: 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(Assets.CAR_ICON),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text('${con.carAlias.value}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text('${con.carEdges.value}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget CarCard(BuildContext context, Car car) {
    return GestureDetector(
      onTap: () {
        con.carAlias.value = car.alias!;
        con.carEdges.value = car.edge!;
        con.nextPagePay(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(Assets.CAR_ICON),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text('${car.alias}',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text('${car.edge}',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }

  Container titleCard() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 20, bottom: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Selecciona tu tarjeta',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(55, 55, 55, 1),
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }

  Container titleVehicle() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 20, bottom: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Selecciona tu vehiculo',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(55, 55, 55, 1),
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }

  Container titleCreditCard() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 20, bottom: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Selecciona tu medio de pago',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(55, 55, 55, 1),
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }

  Container priceContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * .08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
        /*boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
                offset: Offset(0, .5),
              )
            ]*/
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Total:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(
              width: 20,
            ),
            Text('MXN \$180.00',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color.fromRGBO(55, 55, 55, 1),
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buttonNext(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed: con.validForm.value ? () => con.nextButton(context) : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            'Siguiente',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(1.0),
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
      padding: EdgeInsets.all(40),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(0, 0.50),
        )
      ]),

      child: Column(
        children: [
          Text('Pagar')

          //_buttonRegister(context)
        ],
      ),
    );
  }

  Widget buttonBack(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: ImageIcon(
          AssetImage(Assets.CLOSE_OUTLINE),
          color: Theme.of(context).colorScheme.surface,
          size: 150,
        ),
      ),
    ));
  }

  Widget _counterPage(BuildContext context) {
    return Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'Paso ${(con.activePage.value + 1).toString()} de 2',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: InkWell(
                        child: con.activePage.value == index
                            ? CircleAvatar(
                                radius: 6,
                                // check if a dot is connected to the current page
                                // if true, give it a different color
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              )
                            : Align(
                                child: Container(
                                  height: 6,
                                  width: 12,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  decoration: new BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    border: Border.all(
                                        color: Colors.black, width: 0.0),
                                    borderRadius: new BorderRadius.all(
                                        Radius.elliptical(100, 100)),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
