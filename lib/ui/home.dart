import 'package:codetest1/bloc/get/cubit/get_book_cubit.dart';
import 'package:codetest1/data/model/book.dart';
import 'package:codetest1/ui/add_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(title: const Text('Books List'),),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async{
        var result = await Navigator.of(context).push(MaterialPageRoute(builder: (_)=> AddUi()));
        if(result != null && result == 'success'){
          BlocProvider.of<GetBookCubit>(context).getBook();
        }
      },
    ),
    body: BlocBuilder<GetBookCubit, GetBookState>(
      builder: (context, state) {
        if(state is GetBookSuccess){
          List<Book> books = state.books;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context,position){
              return item(books[position],context);
            }
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    )
    );
  }

  Widget item(Book book,BuildContext context){
    return Card(
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context){
                  // Navigator.push(context,
                // MaterialPageRoute(builder: (_) => ))
              },
              backgroundColor: Colors.yellow,
              icon: Icons.edit,
              label: 'Edit'
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context){},
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete'
            ),
          ],
        ),
        child: ListTile(
          title: Text(book.name),
          subtitle : Text(book.item),
          trailing: Text(book.phone)
        ),
      ),
    );
  }
}