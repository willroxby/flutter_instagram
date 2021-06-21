library flutter_instagram;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_instagram/models/_models.dart';

class FlutterInstagram {
  static const String baseUrl = 'https://graph.instagram.com';
  static const String tokenUrl = 'https://api.instagram.com/oauth/access_token';
  static const String accessTokenUrl = 'https://graph.instagram.com/access_token';
  static const String refreshTokenUrl = 'https://graph.instagram.com/refresh_access_token';
  static const String authorizationUrl = 'https://api.instagram.com/oauth/authorize';

  final String clientId = '428707278378117';
  final String clientSecret = '77f2985747e1729547d7c731245a3854';
  final String redirectUri = 'https://booza.app/callback/';
  final String responseCode = 'code';
  final List<String> scopes = ['user_profile', 'user_media'];

  http.Client client = http.Client();

// Get Code
  Future<String> getAuthorizationUrl({String clientId, String redirectUri, List<String> scope}) async {
    var uri = Uri.parse(authorizationUrl).replace(queryParameters: <String, String>{
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'response_type': 'code',
      'scope': scope.join(','),
    });
    return uri.toString();
  }

// Exchange Code for a token
  Future<OauthAccessToken> getShortLivedToken(String code) async {
    var response = await client.post(tokenUrl, body: {
      'client_id': clientId,
      'client_secret': clientSecret,
      'code': Uri.parse(code).queryParameters['code'],
      'grant_type': 'authorization_code',
      'redirect_uri': redirectUri,
    });
    return OauthAccessToken.fromJson(json.decode(response.body));
  }

// Echange shortlivedToken for longlivedtoken
  Future<AccessToken> getLongLivedToken(String token) async {
    var uri = Uri.parse(accessTokenUrl).replace(queryParameters: <String, String>{'grant_type': 'ig_exchange_token', 'client_secret': clientSecret, 'access_token': token});
    var response = await client.get(uri);
    return AccessToken.fromJson(json.decode(response.body));
  }

// Refresh long-lived token
  Future<RefreshAccessToken> refreshAccessToken(String token) async {
    var uri = Uri.parse(refreshTokenUrl).replace(queryParameters: <String, String>{'grant_type': 'ig_refresh_token', 'access_token': token});
    var response = await client.get(uri);
    return RefreshAccessToken.fromJson(json.decode(response.body));
  }

  //Get Me
  Future<User> getMe(String token) async {
    var uri = Uri.parse(baseUrl + '/me').replace(queryParameters: <String, String>{'access_token': token, 'fields': 'username,id,account_type,media_count'});
    var response = await client.get(uri);
    return User.fromJson(json.decode(response.body));
  }

  //Get the
  Future<Iterable<Media>> getMedia(String token) async {
    var uri = Uri.parse(baseUrl + '/me/media')
        .replace(queryParameters: <String, String>{'access_token': token, 'fields': 'caption,id,media_type,media_url,permalink,thumbnail_url,timestamp,username,children', 'limit': '50'});
    var response = await client.get(uri);
    var map = json.decode(response.body);
    var items = map['data'] as Iterable<dynamic>;
    return items.map((item) => Media.fromJson(item));
  }

  //Get a single media image
  Future<Media> getSingleMedia(String token, String id) async {
    var uri = Uri.parse(baseUrl + '/$id').replace(queryParameters: <String, String>{'access_token': token, 'fields': 'id,media_type,media_url,permalink,thumbnail_url,timestamp,username'});
    var response = await client.get(uri);
    return Media.fromJson(json.decode(response.body));
  }
}
