
import '../helper/api.dart';
import '../models/store_product_model.dart';

class CategoriesService{
  Future<List<ProductModel>> getAllProduct({required String categoryName}) async{
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++){
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}