import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/Car.dart';
import 'package:gm_frontend/src/pages/home/menu/car/menu_car_controller.dart';

class MenuCarPage extends StatefulWidget {
  const MenuCarPage({super.key});

  @override
  State<MenuCarPage> createState() => _MenuCarPageState();
}

class _MenuCarPageState extends State<MenuCarPage> {
  MenuCarController con = Get.put(MenuCarController());
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
          UserPage(context),
          RecoveryPassword(context)
        ],
      ),
    );
  }

  SingleChildScrollView RecoveryPassword(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //margin: EdgeInsets.all(1.0),
            //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
            height: MediaQuery.of(context).size.height * 0.68,
            decoration:
                BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 0.5,
                offset: Offset(0, 0.50),
              )
            ]),

            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Enviaremos un código de verificación para confirmar tu cambio de contraseña.',
                    style: TextStyle(
                        color: const Color.fromRGBO(55, 55, 55, 1),
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),

                Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      '¿Dónde quieres recibir el código de verificación?',
                      style: TextStyle(
                          color: const Color.fromRGBO(55, 55, 55, 1),
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RadioListTile<RxInt>(
                      title: const Text(
                        'Correo',
                        style: TextStyle(
                            color: const Color.fromRGBO(84, 88, 89, 1),
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      value: 1.obs,
                      groupValue: con.selectedOption,
                      onChanged: (RxInt? value) {
                        setState(() {
                          con.selectedOption = value!;
                          print("Selected Option: ${con.selectedOption}");
                        });
                      },
                    ),
                    RadioListTile<RxInt>(
                      title: const Text(
                        'Numero de telefono',
                        style: TextStyle(
                            color: const Color.fromRGBO(84, 88, 89, 1),
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      value: 2.obs,
                      groupValue: con.selectedOption,
                      onChanged: (RxInt? value) {
                        setState(() {
                          con.selectedOption = value!;
                          print("Selected Option: ${con.selectedOption}");
                        });
                      },
                    ),
                  ],
                )
                //_buttonRegister(context)
              ],
            ),
          ),
          _buttonNext(context),
        ],
      ),
    );
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

  Widget CardMain(BuildContext context) {
    return Obx(() => Container(
          child: Column(
            children: [
              TitleCarCard(context),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: con.cars.length,
                itemBuilder: (_, index) {
                  return CarCard(context, con.cars[index]);
                },
              ),
              AddNewCar(context),
            ],
          ),
        ));
  }

  Container TitleCarCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Puedes agregar hasta 3 vehículos',
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

  Widget UserPage(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _boxForm(context),
          _buttonNext(context),
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(1.0),
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
      height: MediaQuery.of(context).size.height * 0.68,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 0.5,
          offset: Offset(0, 0.50),
        )
      ]),

      child: Column(
        children: [
          _imageUser(context),
          textFieldAlias(context),
          textnumberPlate(context), ContentRow1(context),
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
          textFieldMark(context),
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
          _textFieldEdge(context),
        ],
      ),
    );
  }

  Widget _textFieldEdge(BuildContext context) {
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
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                fontSize: 20),
            controller: con.edgeController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.left,
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
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                fontSize: 20),
            controller: con.yearController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Año',
              border: InputBorder.none,
            ),
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
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                fontSize: 20),
            controller: con.modelController,
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

  Widget textFieldAlias(BuildContext context) {
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
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              fontSize: 20),
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

  Widget textnumberPlate(BuildContext context) {
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
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              fontSize: 20),
          controller: con.numberPlateController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Placa',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget textFieldMark(BuildContext context) {
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
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                fontSize: 20),
            controller: con.markController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Marca',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child: GestureDetector(
            onTap: () {},
            child: GetBuilder<MenuCarController>(
              builder: (value) => CircleAvatar(
                backgroundImage: con.imageFile != null
                    ? FileImage(con.imageFile!)
                    : const AssetImage(Assets.PROFILE_OUTLINE_1)
                        as ImageProvider,
                radius: 40,
                backgroundColor: Colors.white,
              ),
            )),
      ),
    );
  }

  Widget AddNewCar(BuildContext context) {
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
              'Agregar nuevo vehiculo',
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

  Widget CarCard(BuildContext context, Car car) {
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
                    car.alias!,
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
                    car.mark!,
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
                    car.mark!,
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
                con.DeleteCar(context, car.number_plate);
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
