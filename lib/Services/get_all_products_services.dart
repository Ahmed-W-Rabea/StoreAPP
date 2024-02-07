import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../helper/api.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProductsServices() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
