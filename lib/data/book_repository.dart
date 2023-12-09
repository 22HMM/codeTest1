import 'package:codetest1/data/api/apiservice.dart';
import 'package:codetest1/data/model/book.dart';

class BookRepository{
  final ApiService _apiService;

  BookRepository(this._apiService);

  Future<List<Book>> getBook() => _apiService.getBook();

  Future<Book> addBook(Book book) => _apiService.addBook(book);

  Future<Book> updateBook(String id, Book book) => _apiService.updateBook(id, book);

  Future<Book> deleteBook(String id) => _apiService.deleteBook(id);
}