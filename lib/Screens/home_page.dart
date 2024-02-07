import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Services/get_all_products_services.dart';
import 'package:store_app/models/product_model.dart';

import '../widgets/custome_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "New Tren",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 65),
            child: FutureBuilder<List<ProductModel>>(
              future: AllProductsServices().getAllProductsServices(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100,
                          crossAxisCount: 2,
                          childAspectRatio: 1.5),
                      itemBuilder: (context, index) {
                        return CusCard(
                          product: products[index],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
