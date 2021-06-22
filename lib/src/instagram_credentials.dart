part of instagram;

class InstagramApiCredentials {
  /// The client identifier for this Instagram client.
  ///
  /// Instagram issues each client a separate client identifier and secret,
  /// which allows the server to tell which client is accessing it.
  String clientId;

  /// The client secret for this Instagram client.
  ///
  /// Instagram issues each client a separate client identifier and secret,
  /// which allows the server to tell which client is accessing it.
  String clientSecret;

  /// The token that is sent to Instagram to prove the authorization of a client.
  String accessToken;

  /// The URL of the Instagram endpoint that's used to refresh the credentials.
  ///
  /// This may be `null`, indicating that the credentials can't be refreshed.
  Uri tokenEndpoint;

  /// The specific permissions being requested from Instagram.
  ///
  /// See https://developers.facebook.com/docs/instagram-basic-display-api/overview#permissions
  /// for a full list of available scopes.
  List<String> scopes;

  /// The date at which these credentials will expire, stored in the user's
  /// local time.
  ///
  /// This is likely to be a few seconds earlier than the server's idea of the
  /// expiration date.
  DateTime expiration;

  InstagramApiCredentials(
    this.clientId,
    this.clientSecret, {
    this.accessToken,
    this.scopes,
    this.expiration,
  }) : tokenEndpoint = Uri.parse(InstagramApiBase._tokenUrl);

  InstagramApiCredentials._fromClient(oauth2.Client client) {
    clientId = client.identifier;
    clientSecret = client.secret;

    if (client.credentials != null) {
      accessToken = client.credentials.accessToken;
      tokenEndpoint = client.credentials.tokenEndpoint;
      scopes = client.credentials.scopes;
      expiration = client.credentials.expiration;
    }
  }

  oauth2.Credentials _toOauth2Credentials() => oauth2.Credentials(
        accessToken,
        tokenEndpoint: tokenEndpoint,
        scopes: scopes,
        expiration: expiration,
      );

  String toString() => '$runtimeType { '
      'clientId: $clientId,'
      'clientSecret: $clientSecret,'
      'accessToken: $accessToken,'
      'tokenEndpoint: $tokenEndpoint,'
      'scopes: $scopes,'
      'expiration: $expiration,'
      '}';
}
