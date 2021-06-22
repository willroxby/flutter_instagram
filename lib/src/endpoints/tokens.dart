part of instagram;

class Tokens extends EndpointBase {
  static const String _accessTokenUrl = 'https://graph.instagram.com/access_token';
  static const String _refreshTokenUrl = 'https://graph.instagram.com/refresh_access_token';

  @override
  String get _path => throw UnimplementedError();

  Tokens(InstagramApiBase api) : super(api);

  Future<AccessToken> getLongLivedToken() async {
    final InstagramApiCredentials credentials = await _api.getCredentials();
    print('old ${credentials.accessToken}');
    var jsonString = await _api._get(
        '$_accessTokenUrl?' +
            _buildQuery({
              'grant_type': 'ig_exchange_token',
              'client_secret': credentials.clientSecret,
              'access_token': credentials.accessToken,
            }),
        true);
    var map = json.decode(jsonString);
    return AccessToken.fromJson(map);
  }

  Future<RefreshAccessToken> refreshAccessToken() async {
    final InstagramApiCredentials credentials = await _api.getCredentials();
    var jsonString = await _api._get(
        '$_refreshTokenUrl?' +
            _buildQuery({
              'grant_type': 'ig_refresh_token',
              'access_token': credentials.accessToken,
            }),
        true);
    var map = json.decode(jsonString);
    return RefreshAccessToken.fromJson(map);
  }
}
