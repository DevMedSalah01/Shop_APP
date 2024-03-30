import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl; // networkImage
  bool isFavorite;

  Product({
    @required this.description,
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners(); // like "setState" in providerpackage
    final url = Uri.parse(
        'https://my-first-shop-app-a1273-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$token');
    // try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        //Optimistic update: Roll-Back logic
        _setFavValue(oldStatus);
        throw HttpException('Couldn\'t mark as Fav product.');
      }
    // } catch (error) {
    //   _setFavValue(oldStatus);
    //   throw HttpException('Couldn\'t mark as Fav product.');
    // }
  }
}
