
import 'package:quadleo_machine_test/core/Dio/diohandler.dart';
import 'package:quadleo_machine_test/views/home/repository/model/home_model.dart';

class ProductRepository {
  final DioHandler _dio = DioHandler();

  Future<List<ProductModel>> getProducts() async {
    try {
      final data = await _dio.get('/products'); 
      if (data is List) {
        return data.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Invalid data format');
      }
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
