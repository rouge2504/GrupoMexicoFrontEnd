import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/payments/create/client_payments_create_controller.dart';

class ClientPaymentsCreatePage extends StatelessWidget {
  ClientPlaymentsCreateController con =
      Get.put(ClientPlaymentsCreateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: _buttonNext(context),
          body: ListView(
            children: [
              CreditCardWidget(
                cardNumber: con.cardNumber.value,
                expiryDate: con.expireDate.value,
                cardHolderName: con.cardHolderName.value,
                cvvCode: con.cvvCode.value,
                showBackView: con.isCvvFocused.value,
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
            ],
          ),
        ));
  }

  Widget _buttonNext(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.createCardToken(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'CONTINUAR',
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
