import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:users_app/model/character_model.dart';
import 'package:users_app/screens/detials_screen.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,required this.character,
  });

  final Character character;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(character: character),),),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          //width: double.infinity,
          //height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              ClipRRect(
                child: Image(
                  image: NetworkImage(character.image),
                  width: 170,
                  height: 200,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${character.house} ,${character.actor}",
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}