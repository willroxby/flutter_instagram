part of instagram;

class InstagramApi extends InstagramApiBase {
  InstagramApi(InstagramApiCredentials credentials, {Function(InstagramApiCredentials) onCredentialsRefreshed}) : super(credentials, http.Client(), onCredentialsRefreshed);

  InstagramApi.fromClient(FutureOr<oauth2.Client> client) : super.fromClient(client);

  InstagramApi.fromAuthCodeGrant(oauth2.AuthorizationCodeGrant grant, String responseUri) : super.fromAuthCodeGrant(grant, responseUri);

  static oauth2.AuthorizationCodeGrant authorizationCodeGrant(InstagramApiCredentials credentials, {Function(InstagramApiCredentials) onCredentialsRefreshed}) {
    return InstagramApiBase.authorizationCodeGrant(credentials, http.Client(), onCredentialsRefreshed);
  }

  Future<InstagramApi> getLongLivedToken() async {
    final AccessToken token = await this.tokens.getLongLivedToken();
    final InstagramApiCredentials credentials = await this.getCredentials();
    InstagramApiCredentials instagramApiCredentials =
        InstagramApiCredentials(credentials.clientId, credentials.clientSecret, accessToken: token.access_token, expiration: DateTime.now().add(Duration(seconds: token.expires_in)));

    return InstagramApi(instagramApiCredentials);
  }
}
