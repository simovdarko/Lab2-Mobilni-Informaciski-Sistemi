import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<http.Response> getJokeTypes() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/types"));
    if(response.statusCode==200){
      print("Joke Types Response: ${response.body}");
      return response;
    }else{
      throw Exception("Failed to find a types of jokes!");
    }
  }

  static Future<http.Response> getJokesByType(String type) async {
    var response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if(response.statusCode==200){
      print("Jokes for $type Response: ${response.body}");
      return response;
    }else{
      throw Exception("Failed to find a joke!");
    }
  }

  static Future<http.Response> getRandomJoke() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    if(response.statusCode==200){
      print("Random Joke Response: ${response.body}");
      return response;
    }else{
      throw Exception("Failed to find a random joke!");
    }
  }
}
