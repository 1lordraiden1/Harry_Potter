import 'package:flutter/material.dart';
import 'package:users_app/Repo/api_handler.dart';
import 'package:users_app/screens/character_card.dart';

import '../model/character_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> _characters = [];

  bool _isLoading = true;

  void _loadCharacters() async {
    final data = await DataHandler.getCharacters();
    setState(() {
      _characters = data;
      _isLoading = false;
    });
  }

  // _characters.map((character) => CharacterCard(character: character)).toList()
  @override
  void initState() {
    _loadCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: _characters
                  .map((character) => CharacterCard(character: character))
                  .toList(),
            )),
      ),
    );
  }
}
