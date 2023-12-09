import 'package:codetest1/bloc/get/cubit/get_book_cubit.dart';
import 'package:codetest1/data/api/apiservice.dart';
import 'package:codetest1/data/book_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var getIt = GetIt.I;
void locator(){
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  BookRepository bookRepository = BookRepository(getIt.call());
  getIt.registerLazySingleton(() => bookRepository);

  GetBookCubit getBookCubit = GetBookCubit(getIt.call());
  getIt.registerLazySingleton(() => getBookCubit);
}