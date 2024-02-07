import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Services/updata_product.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custome_button.dart';
import 'package:store_app/widgets/custome_textfield.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "update product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CustomeTextfield(
                onChanged: (data) {
                  productName = data;
                },
                hintText: 'product name',
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextfield(
                onChanged: (data) {
                  desc = data;
                },
                hintText: 'description',
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextfield(
                inputType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
                hintText: 'price',
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextfield(
                onChanged: (data) {
                  image = data;
                },
                hintText: 'image',
              ),
              SizedBox(
                height: 50,
              ),
              CustomeButton(
                onTap: () async {
                  isloading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());

                    // TODO
                  }
                  isloading = false;
                  setState(() {});
                },
                color: Colors.grey,
                textOnButton: 'update',
                text: 'update',
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
