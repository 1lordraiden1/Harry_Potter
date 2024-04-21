import 'dart:convert';
import 'dart:io';

class Character {
  final String id;
  final String name;
  final List<String> alternateNames;
  final String species;
  final String gender;
  final String house;
  final String dateOfBirth;
  final int yearOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final Map<String, dynamic> wand;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final bool alive;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alive,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      alternateNames: List<String>.from(json['alternate_names']) ?? [],
      species: json['species']?? '',
      gender: json['gender'] ?? '',
      house: json['house'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      yearOfBirth: json['yearOfBirth'] ?? 2000,
      wizard: json['wizard'] ?? '',
      ancestry: json['ancestry'] ?? '',
      eyeColour: json['eyeColour'] ?? '',
      hairColour: json['hairColour'] ?? '',
      wand: json['wand'] ?? '',
      patronus: json['patronus'] ?? '',
      hogwartsStudent: json['hogwartsStudent'] ?? '',
      hogwartsStaff: json['hogwartsStaff'] ?? '',
      actor: json['actor'] ?? '',
      alive: json['alive'] ?? '',
      image: json['image'] ?? '',
    );
  }

  static Future<Character?> loadCharacterFromJsonFile(String filePath) async {
    try {
      final file = File(filePath);
      final contents = await file.readAsString();
      final jsonMap = json.decode(contents);
      return Character.fromJson(jsonMap);
    } catch (e) {
      print('Error loading character from JSON file: $e');
      return null;
    }
  }
}

/* void main() async {
  final characterData = {
    "id": "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8",
    "name": "Harry Potter",
    "alternate_names": [
      "The Boy Who Lived",
      "The Chosen One",
      "Undesirable No. 1",
      "Potty"
    ],
    "species": "human",
    "gender": "male",
    "house": "Gryffindor",
    "dateOfBirth": "31-07-1980",
    "yearOfBirth": 1980,
    "wizard": true,
    "ancestry": "half-blood",
    "eyeColour": "green",
    "hairColour": "black",
    "wand": {
      "wood": "holly",
      "core": "phoenix tail feather",
      "length": 11
    },
    "patronus": "stag",
    "hogwartsStudent": true,
    "hogwartsStaff": false,
    "actor": "Daniel Radcliffe",
    "alive": true,
    "image": "https://ik.imagekit.io/hpapi/harry.jpg"
  };

  final harryPotter = Character.fromJson(characterData);
  print('Character: ${harryPotter.name}, Species: ${harryPotter.species}, Actor: ${harryPotter.actor}');
}
 */