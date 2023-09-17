import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:gm_frontend/src/pages/register_car/register_car_controller.dart';

import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

class RegisterCarPage extends StatelessWidget {
  RegisterCarController con = Get.put(RegisterCarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: _buttonBack(context),
            title: Text('Registra tu vehiculo',
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
              CardForm(context),
            ],
          ),
        ));
  }

  Widget CardForm(BuildContext context) {
    return Obx(() => ListView(
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
                formKey: GlobalKey(), // Required
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
            _buttonRegister(context)
          ],
        ));
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child: GestureDetector(
            onTap: () {},
            child: GetBuilder<RegisterCarController>(
              builder: (value) => CircleAvatar(
                backgroundImage: con.imageFile != null
                    ? FileImage(con.imageFile!)
                    : const AssetImage(Assets.IMAGE_OUTLINE) as ImageProvider,
                radius: 40,
                backgroundColor: Colors.white,
              ),
            )),
      ),
    );
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

  Widget _pageForm1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _boxForm(context),
        _buttonNext(context),
      ],
    );
  }

  Widget _buttonBack(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.surface,
          size: 30,
        ),
      ),
    ));
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(1.0),
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(0, 0.50),
        )
      ]),

      child: Column(
        children: [
          _imageUser(context),
          _textFieldAlias(context),
          _textFieldPlaca(context),
          ContentRow1(context),
          ContentRow2(context),

          //_buttonRegister(context)
        ],
      ),
    );
  }

  Container ContentRow1(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _textFieldMark(context),
          _textFieldModel(context),
        ],
      ),
    );
  }

  Container ContentRow2(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _textFieldYear(context),
          _textFieldEdges(context),
        ],
      ),
    );
  }

  Widget _textFieldEdges(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          border: new Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 1.0,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: con.edgeController,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Ejes',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldYear(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          border: new Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 1.0,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: con.yearController,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Año',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _TitlePassword() {
    return Expanded(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Crea tu contraseña',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _Title() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          'Datos personales',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ));
  }

  Widget _WAAdvertising() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.centerLeft,
        child: Text(
          'Este número debe tener Whatsapp en caso de emergencia´',
          style: TextStyle(
            fontSize: 12.0,
          ),
        ));
  }

  Widget _textFieldMark(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          border: new Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 1.0,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: con.markController,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Marca',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldAlias(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: con.aliasController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Alias',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPlaca(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: con.numberPlateController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Numero de placa',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _textFieldModel(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          border: new Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 1.0,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: con.modelController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Modelo',
              border: InputBorder.none,
            ),
          ),
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

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed:
              con.validFormPassword.value ? () => con.register(context) : null,
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
}
