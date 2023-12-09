part of 'get_book_cubit.dart';

sealed class GetBookState extends Equatable {
  const GetBookState();

  @override
  List<Object> get props => [];
}

class GetBookInitial extends GetBookState {}

class GetBookSuccess extends GetBookState{
  final List<Book> books;

  GetBookSuccess(this.books);
  @override
  // TODO: implement props
  List<Object> get props => [books];
}

class GetBookFail extends GetBookState{
  final String error;

  GetBookFail(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}

