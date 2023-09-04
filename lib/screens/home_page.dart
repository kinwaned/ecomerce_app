import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/store_product_model.dart';
import 'package:store_app/services/all_product_service.dart';

import '../../services/wedgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.black,
            )),
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: FutureBuilder<List<ProductModel>>(

          future: AllProductService().getAllProduct(),
          builder: ( BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }else if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return  GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 50
                ),
                itemBuilder: ( context,  index) {
                  return CustomCard(product: products[index],);
                },
              );
            }else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
