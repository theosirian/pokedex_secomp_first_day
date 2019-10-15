import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../widgets/pokemon_item.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<PokemonModel> data;
  String error;

  @override
  void initState() {
    super.initState();

    this.error = null;
    this.data = [];

    this.loadData();
  }

  final baseUrl = 'https://pokeapi.theosirian.com/api/v2';

  Future<PokemonModel> loadItem(item) async {
    final name = item['name'];
    final response = await http.get(
      '$baseUrl/pokemon/$name',
    );

    if (response.statusCode != 200) throw ('Ocorreu um erro!');

    final decoded = jsonDecode(response.body);
    return PokemonModel.fromJson(decoded);
  }

  void loadData() async {
    final url = '$baseUrl/pokemon?limit=4';

    setState(() {
      this.error = null;
    });

    final response = await http.get(url);

    if (response.statusCode != 200) {
      setState(() {
        this.error = 'Ocorreu um erro!';
      });
      return;
    }

    //'{"results":[{"name":"bulbasaur",...}],...}'
    final decoded = jsonDecode(response.body);

    final list = <PokemonModel>[];

    //for (var item in decoded) {
    for (final item in decoded['results']) {
      try {
        final model = await this.loadItem(item);
        list.add(model);
      } catch (e) {
        setState(() {
          this.error = 'Ocorreu um erro!';
        });
        return;
      }
    }

    setState(() {
      this.data = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokédex'),
      ),
      body: this.error != null
          ? Center(
              child: Text(
                this.error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24.0,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: this.data.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return PokemonItem(
                  model: this.data[index],
                );
              },
            ),
    );
  }
}
