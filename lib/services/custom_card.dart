import 'package:flutter/material.dart';
import 'package:store_app/models/store_product_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({ required this.product,
    super.key,
  });

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: Offset(0, 4))
            ],
          ),
          child: Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Handbag Lv',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$225',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 25,
          top: -40,
          child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', height: 75,),
        ),
      ],
    );
  }
}