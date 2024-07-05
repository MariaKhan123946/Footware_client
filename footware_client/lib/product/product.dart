import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "number")
  int? number;



  Product({
    this.id,
    this.name,
    this.number
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}