import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_frontend/src/models/costumerMercadoPago.dart';
import 'package:gm_frontend/src/models/mercado_pago_customer.dart';
import 'package:gm_frontend/src/models/response_api.dart';

import 'package:gm_frontend/src/pages/providers/mercado_pago_provider.dart';

class CreateClientController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController areaPhoneController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  MercadoPagoProvider mercadoPagoProvider = MercadoPagoProvider();

  void createClient() async {
    ResponseApi responseApi = await mercadoPagoProvider.createClient(
      email: emailController.text,
      first_name: nameController.text,
      last_name: lastNameController.text,
      area_code: areaPhoneController.text,
      number: phoneController.text,
    );
  }

  void findClient() async {
    //Response response = await mercadoPagoProvider.findClient(emailController.text);
    MercadoPagoCustomer costumerMercadoPago =
        await mercadoPagoProvider.findClient(emailController.text);
    print('Response Api!!!: ${costumerMercadoPago.id}');
  }
}
