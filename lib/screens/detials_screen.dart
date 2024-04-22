import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:users_app/model/character_model.dart';

import '../common/widgets/character_tile.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: NetworkImage(character.image),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Text(
                    character.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .apply(color: Colors.white),
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: character.alternateNames
                  .map(
                    (name) => oneCharacterSpec(
                      specKey: "NickName",
                      value: name,
                    ),
                  )
                  .toList(),
            ),
            oneCharacterSpec(
              specKey: "Species",
              value: character.species,
            ),
          ],
        ),
      ),
    );
  }
}
