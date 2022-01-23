// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      customerID: json['id'] as int?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.customerID,
      'email': instance.email,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
    };
