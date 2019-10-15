import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../widgets/pokemon_item.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel model;

  DetailPage({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: this.model.id,
              child: Image.network(
                this.model.sprite,
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.33,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Hero(
              tag: this.model.name,
              child: Text(
                this.model.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
