
import 'package:dio/dio.dart';
import 'package:users_app/model/character_model.dart';

class DataHandler {

  static String apiKey = "https://hp-api.onrender.com/api";

  static var  dio = Dio();


  static Future<List<Character>> getCharacters() async {
    var response = await dio.get('$apiKey/characters');

    if (response.statusCode == 200){
      final responseData = response.data as List<dynamic>;
      final characters = responseData.map((character) => Character.fromJson(character)).toList();
      return characters;
    }
    return [];
  }
}