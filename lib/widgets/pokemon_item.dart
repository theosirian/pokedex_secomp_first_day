import 'package:flutter/material.dart';

import '../screens/detail.dart';
import '../models/pokemon.dart';

class PokemonItem extends StatelessWidget {
  final PokemonModel model;

  PokemonItem({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  model: this.model,
                ),
              ),
            );
          },
          // Sprite do pokémon
          leading: Hero(
            tag: this.model.id,
            child: Image.network(
              this.model.sprite,
            ),
          ),
          // Nome do pokémon
          title: Hero(
            tag: this.model.name,
            child: Text(
              this.model.name.toUpperCase(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          // Peso e altura
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${this.model.weight} kg',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Text(
                '${this.model.height} cm',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          // Indicador de captura
          trailing: Icon(Icons.close),
        ),
      ),
    );
  }
}
