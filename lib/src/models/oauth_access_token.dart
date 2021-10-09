part of instagram.models;

@JsonSerializable(createToJson: false)
class OauthAccessToken extends Object {
  OauthAccessToken();

  factory OauthAccessToken.fromJson(Map<String, dynamic> json) => _$OauthAccessTokenFromJson(json);

  String? access_token;
  int? user_id;

  @override
  String toString() => '$runtimeType { access_token: $access_token, user_id: $user_id}';
}
