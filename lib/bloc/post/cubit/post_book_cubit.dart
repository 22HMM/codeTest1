import 'package:bloc/bloc.dart';
import 'package:codetest1/data/book_repository.dart';
import 'package:codetest1/data/model/book.dart';
import 'package:equatable/equatable.dart';

part 'post_book_state.dart';

class PostBookCubit extends Cubit<PostBookState> {
  final BookRepository _bookRepository;
  PostBookCubit(this._bookRepository) : super(PostBookInitial());

  void addBook(Book book){
    emit(PostBookLoading());
    _bookRepository.addBook(book)
    .then((value) => emit(PostBookSuccess()))
    .catchError((e) => emit(PostBookFail(e)));
  }
}
