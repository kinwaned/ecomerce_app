import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/store_product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/services/wedgets/custom_button.dart';

import '../services/wedgets/custom_form_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'product page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? desc, productName, image;

  String? price;

  bool isLoading = false;

  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
              )),
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'Description'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    keyboardKey: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    hintText: 'Price'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image'),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                    text: 'Update',
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                       await updateProduct(product);
                        print('success');
                      } catch (e) {
                        print(e.toString());

                      }
                      isLoading = false;
                      setState(() {});
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
   await UpdateProductService().updateProduct(
     id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
