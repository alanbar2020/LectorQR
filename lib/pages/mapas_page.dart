import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/widgets/item_builder.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemBuidlerMapasDireccion(tipo: 'geo');
  }
}
