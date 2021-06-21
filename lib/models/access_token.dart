part of flutter_instagram.models;

@JsonSerializable(createToJson: false)
class AccessToken extends Object {
  AccessToken();

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

  String access_token;
  String token_type;
  int expires_in;
}
