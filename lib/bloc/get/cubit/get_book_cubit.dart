import 'package:bloc/bloc.dart';
import 'package:codetest1/data/book_repository.dart';
import 'package:codetest1/data/model/book.dart';
import 'package:equatable/equatable.dart';

part 'get_book_state.dart';

class GetBookCubit extends Cubit<GetBookState> {
  final BookRepository _bookRepository;
  GetBookCubit(this._bookRepository) : super(GetBookInitial()){
    getBook();
  }

  void getBook(){
    emit(GetBookInitial());
    _bookRepository.getBook()
    .then((value) => emit(GetBookSuccess(value)))
    .catchError((e) => emit(GetBookFail('Error')));
  }
}
