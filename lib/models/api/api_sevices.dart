import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'product_model.dart';

part "api_service.g.dart";

@RestApi(baseUrl: "https://votre-base-url-supab")
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

  // --- CREATE PRODUCT (Optionnel) ---
  @POST("/products")
  Future<Product> createProduct(@Body() Product product);
}
