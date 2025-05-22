
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {

  const factory UserInfoModel({
    required String email,
    required String pinCode,
    required String address,
    required String city,
    required String state,
    required String country,
    required String bankAccountNumber,
    required String accountHolderName,
    required String ifscCode,
    required String profileImageBase64, required String uid
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String,dynamic> json) => _$UserInfoModelFromJson(json);

}