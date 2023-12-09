import 'package:codetest1/bloc/post/cubit/post_book_cubit.dart';
import 'package:codetest1/data/model/book.dart';
import 'package:codetest1/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBookCubit>(
      create: (context) => PostBookCubit(getIt.call()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Book'),
          ),
          body: BlocBuilder<PostBookCubit, PostBookState>(
            builder: (context, state) {
              if(state is PostBookLoading){
                return Center(child: CircularProgressIndicator());
              }
              else if(state is PostBookSuccess)
              {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Success'),
                      TextButton(onPressed: (){
                        Navigator.pop(context, 'success');
                      }, child: const Text('Go Home'))
                    ],
                  ),
                );
              }
              else if(state is PostBookFail){
                return Center(child: Text(state.error));
              }
              return BookForm();
            },
          )),
    );
  }
}

class BookForm extends StatefulWidget {
  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';  // Initialize with an empty string
  String _phone = ''; // Initialize with an empty string
  String _item = '';  // Initialize with an empty string

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.blue,
    );

    return Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value){
                _name = value ?? '';
              }
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your phone'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone';
                }
                return null;
              },
              onSaved: (value){
                _phone = value ?? '';
              }
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your item'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your item';
                }
                return null;
              },
              onSaved: (value){
                _item = value ?? '';
              }
            ),
            const SizedBox(height: 10),
            TextButton(
              style: flatButtonStyle,
              onPressed: (){
                if(_formKey.currentState?.validate() ?? false){
                  _formKey.currentState?.save();
                  Book book = Book(null,_name,_phone,_item);
                  context.read<PostBookCubit>().addBook(book);
                }
            }, child: const Text('Add Book')),
          ],
        ));
  }
}
