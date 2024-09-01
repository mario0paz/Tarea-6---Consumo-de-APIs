import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Tarea-6---Consumo-de-APIs/models/meal.dart'; 

Future<Meal> fetchMeal(int id) async {
  final response = await http.get(
    Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'),
  );

  if (response.statusCode == 200) {
    
    final jsonResponse = json.decode(response.body);
    final meal = Meal.fromJson(jsonResponse['meals'][0]); 
    return meal;
  } else {
    throw Exception('Failed to load meal');
  }
}
