// GENERATED CODE - DO NOT MODIFY BY HAND

part of instagram.models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList();

Media _$MediaFromJson(Map<String, dynamic> json) => Media()
  ..caption = json['caption'] as String?
  ..id = json['id'] as String?
  ..media_type = json['media_type'] as String?
  ..media_url = json['media_url'] as String?
  ..permalink = json['permalink'] as String?
  ..thumbnail_url = json['thumbnail_url'] as String?
  ..timestamp = json['timestamp'] as String?
  ..username = json['username'] as String?
  ..children = json['children'] == null
      ? null
      : Children.fromJson(json['children'] as Map<String, dynamic>);

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..account_type = json['account_type'] as String?
  ..id = json['id'] as String?
  ..media_count = json['media_count'] as int?
  ..username = json['username'] as String?;

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken()
  ..access_token = json['access_token'] as String?
  ..token_type = json['token_type'] as String?
  ..expires_in = json['expires_in'] as int?;

OauthAccessToken _$OauthAccessTokenFromJson(Map<String, dynamic> json) =>
    OauthAccessToken()
      ..access_token = json['access_token'] as String?
      ..user_id = json['user_id'] as int?;

RefreshAccessToken _$RefreshAccessTokenFromJson(Map<String, dynamic> json) =>
    RefreshAccessToken()
      ..access_token = json['access_token'] as String?
      ..token_type = json['token_type'] as String?
      ..expires_in = json['expires_in'] as int?;

InstagramError _$InstagramErrorFromJson(Map<String, dynamic> json) =>
    InstagramError()
      ..status = json['status'] as int?
      ..message = json['message'] as String?;
