part of 'post_book_cubit.dart';

sealed class PostBookState extends Equatable {
  const PostBookState();

  @override
  List<Object> get props => [];
}

class PostBookInitial extends PostBookState {}

class PostBookLoading extends PostBookState{}

class PostBookSuccess extends PostBookState{}

class PostBookFail extends PostBookState{
  final String error;

  PostBookFail(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
