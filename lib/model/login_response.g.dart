// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['id'] as int?,
      relatedEntityId: json['related_entity_id'] as int?,
      relatedEntityRecordId: json['related_entity_record_id'] as int?,
      signInTime: json['signontime'] as String?,
      encryptionKey: json['encryptionkey'] as String?,
      userId: json['user_id'] as int?,
      email: json['email'] as String?,
      roleCode: json['role_code'] as String?,
      areaCode: json['area_code'] as int?,
      dashboardName: json['dashboard_name'] as String?,
      nationalityCode: json['nationality_code'] as String?,
      creationSource: json['creation_source'] as String?,
      roleId: json['role_id'] as int?,
      applicantClassification: json['applicant_classification'] as String?,
      username: json['login'] as String?,
      locationId: json['location_id'] as String?,
      languageId: json['language_id'] as String?,
      urlToken: json['urltoken'] as String?,
      language: json['language'] as String?,
      roleGroup: json['role_group'] as String?,
      forgetPasswordCount: json['forget_password_count'] as int?,
      relatedEntityName: json['related_entity_name'] as String?,
      jobTitle: json['job_title'] as String?,
      statusCode: json['status_code'] as String?,
      encryptedRelatedEntityRecordId:
          json['encrypted_related_entity_record_id'] as String?,
      name: json['name'] as String?,
      locationIds: json['location_ids'] as int?,
      qrLink: json['qr_link'] as String?,
      crnNn: json['crn_nn'] as String?,
      isLoggedIn: json['is_login'] as int?,
      mobileNumber: json['mobile'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'related_entity_id': instance.relatedEntityId,
      'related_entity_record_id': instance.relatedEntityRecordId,
      'signontime': instance.signInTime,
      'encryptionkey': instance.encryptionKey,
      'user_id': instance.userId,
      'email': instance.email,
      'role_code': instance.roleCode,
      'area_code': instance.areaCode,
      'dashboard_name': instance.dashboardName,
      'nationality_code': instance.nationalityCode,
      'creation_source': instance.creationSource,
      'role_id': instance.roleId,
      'applicant_classification': instance.applicantClassification,
      'login': instance.username,
      'location_id': instance.locationId,
      'language_id': instance.languageId,
      'urltoken': instance.urlToken,
      'language': instance.language,
      'role_group': instance.roleGroup,
      'forget_password_count': instance.forgetPasswordCount,
      'related_entity_name': instance.relatedEntityName,
      'job_title': instance.jobTitle,
      'status_code': instance.statusCode,
      'encrypted_related_entity_record_id':
          instance.encryptedRelatedEntityRecordId,
      'name': instance.name,
      'location_ids': instance.locationIds,
      'qr_link': instance.qrLink,
      'crn_nn': instance.crnNn,
      'is_login': instance.isLoggedIn,
      'mobile': instance.mobileNumber,
    };
