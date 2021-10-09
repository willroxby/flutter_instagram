part of instagram.models;

@JsonSerializable(createToJson: false)
class RefreshAccessToken extends Object {
  RefreshAccessToken();

  factory RefreshAccessToken.fromJson(Map<String, dynamic> json) => _$RefreshAccessTokenFromJson(json);

  String? access_token;
  String? token_type;
  int? expires_in;

  @override
  String toString() => '$runtimeType { access_token: $access_token, token_type: $token_type, expires_in: $expires_in}';
}
