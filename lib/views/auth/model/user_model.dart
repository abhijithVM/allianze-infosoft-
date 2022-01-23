import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: 'id')
  final int? customerID;
  final String? email;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'phone')
  final String? phone;


  const User( {
    this.customerID,
    this.email,
    this.username,
    this.name,
    this.phone,
 
  });

  @override
  List<Object> get props => [];
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
