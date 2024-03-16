import '../models/book_model/book_model.dart';
import '../models/my_response/my_response.dart';
import '../network/api_provider.dart';

class BookRepository {
  Future<MyResponse> getAllBooks() => ApiProvider.getAllBooks();

  Future<MyResponse> addBook(BookModel bookModel) =>
      ApiProvider.addBook(bookModel);

  Future<MyResponse> deleteBook(String bookUUID) =>
      ApiProvider.deleteBook(bookUUID);

  Future<MyResponse> updateBook(BookModel bookModel) =>
      ApiProvider.updateBook(bookModel);
}
