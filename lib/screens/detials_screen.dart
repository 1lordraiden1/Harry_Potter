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
                IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.arrow_back,color: Colors.white,),),
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
            oneCharacterSpec(specKey: 'gender', value: character.gender),
            oneCharacterSpec(specKey: 'house', value: character.house),
            oneCharacterSpec(
              specKey: 'dateOfBirth',
              value: character.dateOfBirth,
            ),
            oneCharacterSpec(
                specKey: 'yearOfBirth',
                value: character.yearOfBirth == 3000 ? 'NaN' : character.yearOfBirth.toString()),
            oneCharacterSpec(
                specKey: 'wizard', value: character.wizard.toString()),
            oneCharacterSpec(specKey: 'ancestry', value: character.ancestry),
            oneCharacterSpec(specKey: 'eyeColour', value: character.eyeColour),
            oneCharacterSpec(
                specKey: 'hairColour', value: character.hairColour),
            /*  oneCharacterSpec(
              specKey: 'wand',
              value:
                  'wood: ${character.wand.wood}, core: ${character.wand.core}, length: ${character.wand.length}',
            ), */
            oneCharacterSpec(specKey: 'patronus', value: character.patronus),
            oneCharacterSpec(
                specKey: 'hogwartsStudent',
                value: character.hogwartsStudent.toString()),
            oneCharacterSpec(
                specKey: 'hogwartsStaff',
                value: character.hogwartsStaff.toString()),
            oneCharacterSpec(specKey: 'actor', value: character.actor),
            oneCharacterSpec(
                specKey: 'alive', value: character.alive.toString()),
          ],
        ),
      ),
    );
  }
}
