import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/CardModel.dart';
import 'package:gm_frontend/src/pages/home/menu/payment_methods/menu_payment_methods_controller.dart';

import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

class MenuPaymentMethodsPage extends StatelessWidget {
  MenuPaymentMethodsController con = MenuPaymentMethodsController();

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
          'Mis vehiculos',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: con.pageController,
        children: [
          CardMain(context),
          CreditCardPage(context),
        ],
      ),
    );
  }

  Widget CreditCardPage(BuildContext context) {
    return Obx(() => ListView(
          children: [
            CreditCardWidget(
              cardNumber: con.cardNumber.value,
              expiryDate: con.expireDate.value,
              cardHolderName: con.cardHolderName.value,
              cvvCode: con.cvvCode.value,
              showBackView: false,
              cardBgColor: Colors.red,
              labelValidThru: 'VALID\nTHRU',
              obscureCardNumber: true,
              obscureInitialCardNumber: false,
              obscureCardCvv: true,
              height: 175,
              labelCardHolder: 'NOMBRE Y APELLIDO',
              textStyle: TextStyle(color: Colors.black),
              width: MediaQuery.of(context).size.width,
              animationDuration: Duration(milliseconds: 1000),
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
              onCreditCardWidgetChange: (CreditCardBrand) {},
              glassmorphismConfig: Glassmorphism(
                blurX: 10.0,
                blurY: 10.0,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.grey.withAlpha(70),
                    Colors.white.withAlpha(20),
                  ],
                  stops: const <double>[
                    0.3,
                    0,
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CreditCardForm(
                formKey: con.formKey, // Required
                onCreditCardModelChange:
                    con.onCreditCardModelChanged, // Required
                themeColor: Colors.red,
                obscureCvv: true,
                obscureNumber: true,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                enableCvv: true,
                cardNumberValidator: (String? cardNumber) {},
                expiryDateValidator: (String? expiryDate) {},
                cvvValidator: (String? cvv) {},
                cardHolderValidator: (String? cardHolderName) {},
                onFormComplete: () {
                  // callback to execute at the end of filling card data
                },
                cardNumberDecoration: const InputDecoration(
                  suffixIcon: Icon(Icons.credit_card),
                  border: OutlineInputBorder(),
                  labelText: 'Numero de la tarjeta',
                  hintText: 'XXXX XXXX XXXX XXXX',
                ),
                expiryDateDecoration: const InputDecoration(
                  suffixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                  labelText: 'Fecha de Expiracion',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Titular de la tarjeta',
                ),
                cardHolderName: '',
                cardNumber: '',
                cvvCode: '',
                expiryDate: '',
              ),
            ),
            _buttonNext(context),
          ],
        ));
  }

  Widget _buttonNext(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed: con.validForm.value ? () => con.register(context) : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            'Guardar cambios',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget UserPage(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          cardCreditCard(context),
          _buttonNext(context),
        ],
      ),
    );
  }

  Container cardCreditCard(BuildContext context) {
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
                    child: Text('Tarjeta terminada en 1234',
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

  Widget CardMain(BuildContext context) {
    return Obx(() => Container(
          child: Column(
            children: [
              TitleCarCard(context),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: con.cardsModel.length,
                itemBuilder: (_, index) {
                  return CarCard(context, con.cardsModel[index]);
                },
                /*children: [
            CarCard(context),
            CarCard(context),
            CarCard(context),
          ]*/
              ),
              AddNewCreditCard(context),
            ],
          ),
        ));
  }

  Widget AddNewCreditCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * .15,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: () {
          con.pageController.jumpToPage(1);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              'Agregar nuevo metodo de pago',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Container TitleCarCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Medios de pago registrados',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }

  Widget CarCard(BuildContext context, CardModel card) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.only(left: 15, right: 15),
          minimumSize: Size(50, 50),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
      onPressed: () {
        con.pageController.jumpToPage(1);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 0.5,
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
              width: MediaQuery.of(context).size.width * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.cardNumber!,
                    style: TextStyle(
                        color: const Color.fromRGBO(84, 88, 089, 1),
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    card.cardNumber!,
                    style: TextStyle(
                        color: const Color.fromRGBO(84, 88, 089, 1),
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    card.cardNumber!,
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
            IconButton(
              onPressed: () {
                print('Delete');
              },
              icon: ImageIcon(
                AssetImage(Assets.DELETE_OUTLINE),
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
