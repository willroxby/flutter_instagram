part of flutter_instagram.models;

@JsonSerializable(createToJson: false)
class OauthAccessToken extends Object {
  OauthAccessToken();

  factory OauthAccessToken.fromJson(Map<String, dynamic> json) => _$OauthAccessTokenFromJson(json);

  String access_token;
  int user_id;
}
