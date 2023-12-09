import 'package:codetest1/data/model/book.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'apiservice.g.dart';
@RestApi(baseUrl: 'https://65734aaf192318b7db41e185.mockapi.io/books')
abstract class ApiService{
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET('')
  Future<List<Book>> getBook();

  @POST('')
  Future<Book> addBook(@Body() Book book);

  @PUT('{id}')
  Future<Book> updateBook(@Path()String id,@Body() Book book);

  @DELETE('{id}')
  Future<Book> deleteBook(@Path() String id);
}