// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      customerID: json['id'] as int?,
      email: json['email'] as String?,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.customerID,
      'email': instance.email,
      'userName': instance.userName,
      'name': instance.name,
      'phone': instance.phone,
    };
