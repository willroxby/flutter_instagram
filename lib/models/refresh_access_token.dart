part of flutter_instagram.models;

@JsonSerializable(createToJson: false)
class RefreshAccessToken extends Object {
  RefreshAccessToken();

  factory RefreshAccessToken.fromJson(Map<String, dynamic> json) => _$RefreshAccessTokenFromJson(json);

  String access_token;
  String token_type;
  int expires_in;
}
