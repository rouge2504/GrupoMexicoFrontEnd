import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/pages/home/menu/account/menu_account_controller.dart';

class MenuAccountPage extends StatefulWidget {
  const MenuAccountPage({super.key});

  @override
  State<MenuAccountPage> createState() => _MenuAccountPageState();
}

class _MenuAccountPageState extends State<MenuAccountPage> {
  MenuAccountController con = Get.put(MenuAccountController());
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
        physics: NeverScrollableScrollPhysics(),
        controller: con.pageController,
        children: [
          AccountMain(context),
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
                textFielPassword(context),
                textFielPasswordConfirm(context),

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

  Widget textFielPassword(BuildContext context) {
    return Obx(() => Container(
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
              controller: con.passwordController,
              keyboardType: TextInputType.text,
              obscureText: !con.passwordVisible.value,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    con.passwordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    con.passwordVisible.value = !con.passwordVisible.value;
                  },
                ),
              ),
            ),
          ),
        ));
  }

  Widget textFielPasswordConfirm(BuildContext context) {
    return Obx(() => Container(
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
              controller: con.passwordConfirmController,
              keyboardType: TextInputType.text,
              obscureText: !con.passwordConfirmVisible.value,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Confirma contraseña',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    con.passwordConfirmVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    con.passwordConfirmVisible.value =
                        !con.passwordConfirmVisible.value;
                  },
                ),
              ),
            ),
          ),
        ));
  }

  Widget AccountMain(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardUser(context),
          ChangePassword(context),
        ],
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
          textFieldName(context),
          textLastName(context),
          textFieldEmail(context),
          _textFieldPhone(context), _WAAdvertising(),
          //_buttonRegister(context)
        ],
      ),
    );
  }

  Widget _textFieldPhone(BuildContext context) {
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
          controller: con.phoneController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Telefono a 10 digitos',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _WAAdvertising() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.centerLeft,
        child: Text(
          'Número con Whatsapp para uso en emergencias',
          style: TextStyle(
            fontSize: 12.0,
          ),
        ));
  }

  Widget _buttonNext(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed: con.validForm.value ? () => con.nextButton() : null,
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

  Widget textFieldName(BuildContext context) {
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
          controller: con.nameController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Nombre',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget textLastName(BuildContext context) {
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
          controller: con.lastNameController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Apellido',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget textFieldEmail(BuildContext context) {
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
          controller: con.emailController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Email',
            border: InputBorder.none,
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
            child: GetBuilder<MenuAccountController>(
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

  Widget ChangePassword(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.only(left: 15, right: 15),
          minimumSize: Size(50, 50),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
      onPressed: () {
        con.pageController.jumpToPage(2);
      },
      child: Container(

          //margin: EdgeInsets.only(left: 15, right: 15),
          height: MediaQuery.of(context).size.height * 0.10,
          decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 0.5,
              offset: Offset(0.50, 0.10),
            )
          ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.lock_outline,
                    size: 30,
                    color: Theme.of(context).colorScheme.surface,
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Cambiar contraseña',
                  style: TextStyle(
                      color: const Color.fromRGBO(84, 88, 089, 1),
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.surface,
                size: 28,
              ),
            ],
          )),
    );
  }

  Widget CardUser(BuildContext context) {
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
              width: MediaQuery.of(context).size.width * 0.58,
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
    );
  }
}
