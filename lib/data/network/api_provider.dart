import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants/app_constanats.dart';
import '../models/book_model/book_model.dart';
import '../models/my_response/my_response.dart';

class ApiProvider {
  static Future<MyResponse> getAllBooks() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/book");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
              ?.map((e) => BookModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> addBook(BookModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/book");
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJson()]),
      );
      if (response.statusCode == 201) {
        return MyResponse(data: "Product added successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> deleteBook(String productUUID) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/book");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([
          {"_uuid": productUUID}
        ]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product deleted successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateBook(BookModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/book");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJsonForUpdate()]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product updated successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}