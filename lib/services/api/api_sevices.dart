import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'product_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://votre-b")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/products")
  Future<List<Product>> getProducts();

  @GET("/products/{id}")
  Future<Product> getProductDetails(@Path("id") int id);

  @GET("/products")
  Future<List<Product>> getProductsByCategory(
    @Query("type") String categoryType,
  );

  @POST("/products")
  Future<Product> createProduct(@Body() Product product);
}
