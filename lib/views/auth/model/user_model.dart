import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  @JsonKey(name: 'id')
  final int? customerID;
  final String? email;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'phone')
  final String? phone;

  const UserModel({
    this.customerID,
    this.email,
    this.userName,
    this.name,
    this.phone,
  });

  @override
  List<Object> get props => [];
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
