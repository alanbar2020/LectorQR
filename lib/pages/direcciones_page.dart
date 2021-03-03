import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/item_builder.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemBuidlerMapasDireccion(tipo: 'http');
  }
}
