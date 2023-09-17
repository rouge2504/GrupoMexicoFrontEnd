import 'package:flutter/material.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:gm_frontend/src/pages/home/media/resources_media_controller.dart';

class ResourcesMediaPage extends StatelessWidget {
  ResourcesMediaController con = ResourcesMediaController();

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
            //Navigator.pop(context);
            con.GoToHome();
          },
        )),
        backgroundColor: Colors.white,
        title: Text(
          'Contenido',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
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
      onPressed: () {},
      child: Container(
        height: 180,
        child: Stack(children: [
          Card(
            // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // Set the clip behavior of the card
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // Define the child widgets of the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                // Image.asset(
                //   Assets.ALERT_ICON,
                //   height: 80,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),

                /*Image.network(
                  'https://www.gmautopista.com/PublishingImages/Slides/slide0505.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 80,
                ),*/
                // Add a container with padding that contains the card's title, text, and buttons
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Display the card's title using a font size of 24 and a dark grey color
                      Text(
                        "CONSEJOS DE SEGURIDAD",
                        style: TextStyle(
                            fontFamily: 'FjallaOne',
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 20),
                      ),
                      // Add a space between the title and the text
                      Container(height: 3),
                      // Display the card's text using a font size of 15 and a light grey color
                      Text(
                        'Aprende todo lo que necesitas para tu viaje',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                // Add a small space between the card and the next widget
                Container(height: 5),
              ],
            ),
          ),
          Positioned.fill(
            left: 20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromRGBO(124, 173, 172, 1),
                child: Container(
                  alignment: Alignment.center,
                  child: ImageIcon(
                    AssetImage(Assets.EVENT_OUTLINE),
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
