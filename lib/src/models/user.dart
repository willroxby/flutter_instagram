part of instagram.models;

@JsonSerializable(createToJson: false)
class User extends Object {
  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String? account_type;
  String? id;
  int? media_count;
  String? username;

  @override
  String toString() => '$runtimeType { account_type: $account_type, id: $id, media_count: $media_count, username: $username}';
}
