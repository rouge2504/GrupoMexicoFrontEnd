import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MenuSuggestionPage extends StatelessWidget {
  const MenuSuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Sugerencias',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _boxForm(context),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Container(
        //margin: EdgeInsets.all(1.0),
        //padding: EdgeInsets.fromLTRB(0, 0, 0, 210),
        width: double.infinity,
        padding: EdgeInsets.all(20.0),

        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 0.5,
            offset: Offset(0, 0.50),
          )
        ]),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Con tu ayuda podemos mejorar para ofrecerte un mejor servicio. \n \nSelecciona del listado el tema de tu interés y agrega el detalle de tu sugerencia en el campo inferior.',
              style: TextStyle(
                color: Color.fromRGBO(55, 55, 55, 1),
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .1,
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: SizedBox(
                  height: 300,
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                value: 'Seleccionar',
                alignment: Alignment.center,
                items: [
                  DropdownMenuItem(
                      child: Text("Seleccionar"), value: "Seleccionar"),
                  DropdownMenuItem(child: Text("USA"), value: "USA"),
                  DropdownMenuItem(child: Text("Canada"), value: "Canada"),
                  DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
                  DropdownMenuItem(child: Text("England"), value: "England"),
                ],
                onChanged: (_) {},
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  elevation: 2,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: const TextField(
                maxLines: 7, // <-- SEE HERE
                minLines: 1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(173, 173, 173, 1))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(173, 173, 173, 1))),
                  hintText: 'Enter a search ter',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(173, 173, 173, 1)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
