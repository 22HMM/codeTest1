import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';
@JsonSerializable()
class Book{
  String? id;
  String name;
  String phone;
  String item;
  Book(this.id,this.name,this.phone,this.item);

  factory Book.fromJson(Map<String,dynamic> json) => _$BookFromJson(json);
  Map<String,dynamic> toJson() => _$BookToJson(this);
}