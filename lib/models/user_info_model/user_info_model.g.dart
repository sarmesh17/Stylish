// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      email: json['email'] as String,
      pinCode: json['pinCode'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      bankAccountNumber: json['bankAccountNumber'] as String,
      accountHolderName: json['accountHolderName'] as String,
      ifscCode: json['ifscCode'] as String,
      profileImageBase64: json['profileImageBase64'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'pinCode': instance.pinCode,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'bankAccountNumber': instance.bankAccountNumber,
      'accountHolderName': instance.accountHolderName,
      'ifscCode': instance.ifscCode,
      'profileImageBase64': instance.profileImageBase64,
      'uid': instance.uid,
    };
