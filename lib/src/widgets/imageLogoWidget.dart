import 'package:digital_business/src/model/card_model.dart';
import 'package:flutter/material.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget(this.model, {super.key});
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.sizeOf(context);
    // Calcula a proporção desejada com base no tamanho da tela
    //const aspectRatio = 317 / 317;
    return ClipRRect(
      child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            child: Image.network(
                fit: BoxFit.fill,
                model.picture,
                //   fit: BoxFit.cover,
                width: 317,
                height: 300
                //  width: kIsWeb ? 271 : null, // Largura específica para a web
                // height: kIsWeb ? 271 : null, // Altura específica para a web
                ),
          ),
        ],
      ),
    );
  }
}
