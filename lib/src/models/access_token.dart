part of instagram.models;

@JsonSerializable(createToJson: false)
class AccessToken extends Object {
  AccessToken();

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

  String? access_token;
  String? token_type;
  int? expires_in;

  @override
  String toString() => '$runtimeType { access_token: $access_token, token_type: $token_type, expires_in: $expires_in}';

}
