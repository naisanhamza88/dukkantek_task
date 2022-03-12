// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

/// Created By: Hamza 28/9/2020
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'related_entity_id')
  int? relatedEntityId;

  @JsonKey(name: 'related_entity_record_id')
  int? relatedEntityRecordId;

  @JsonKey(name: 'signontime')
  String? signInTime;

  @JsonKey(name: 'encryptionkey')
  String? encryptionKey;

  @JsonKey(name: 'user_id')
  int? userId;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'role_code')
  String? roleCode;

  @JsonKey(name: 'area_code')
  int? areaCode;

  @JsonKey(name: 'dashboard_name')
  String? dashboardName;

  @JsonKey(name: 'nationality_code')
  String? nationalityCode;

  @JsonKey(name: 'creation_source')
  String? creationSource;

  @JsonKey(name: 'role_id')
  int? roleId;

  @JsonKey(name: 'applicant_classification')
  String? applicantClassification;

  @JsonKey(name: 'login')
  String? username;

  @JsonKey(name: 'location_id')
  String? locationId;

  @JsonKey(name: 'language_id')
  String? languageId;

  @JsonKey(name: 'urltoken')
  String? urlToken;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'role_group')
  String? roleGroup;

  @JsonKey(name: 'forget_password_count')
  int? forgetPasswordCount;

  @JsonKey(name: 'related_entity_name')
  String? relatedEntityName;

  @JsonKey(name: 'job_title')
  String? jobTitle;

  @JsonKey(name: 'status_code')
  String? statusCode;

  @JsonKey(name: 'encrypted_related_entity_record_id')
  String? encryptedRelatedEntityRecordId;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'location_ids')
  int? locationIds;

  @JsonKey(name: 'qr_link')
  String? qrLink;

  @JsonKey(name: 'crn_nn')
  String? crnNn;

  @JsonKey(name: 'is_login')
  int? isLoggedIn;

  @JsonKey(name: 'mobile')
  String? mobileNumber;

  LoginResponse(
      {this.id,
      this.relatedEntityId,
      this.relatedEntityRecordId,
      this.signInTime,
      this.encryptionKey,
      this.userId,
      this.email,
      this.roleCode,
      this.areaCode,
      this.dashboardName,
      this.nationalityCode,
      this.creationSource,
      this.roleId,
      this.applicantClassification,
      this.username,
      this.locationId,
      this.languageId,
      this.urlToken,
      this.language,
      this.roleGroup,
      this.forgetPasswordCount,
      this.relatedEntityName,
      this.jobTitle,
      this.statusCode,
      this.encryptedRelatedEntityRecordId,
      this.name,
      this.locationIds,
      this.qrLink,
      this.crnNn,
      this.isLoggedIn,
      this.mobileNumber});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
