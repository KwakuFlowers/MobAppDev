// ignore_for_file: prefer_const_declarations

class UserFields {
  static final List<String> columns = [id, username, password];
  static final String id = '_id';
  static final String username = 'username';
  static final String password = 'password';
}

class User {
  final int? id;
  final String username;
  final String password;

  const User({this.id, required this.username, required this.password});

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.username: username,
        UserFields.password: password,
      };
  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int?,
        username: json[UserFields.username] as String,
        password: json[UserFields.password] as String,
      );

  User copy({int? id, String? username, String? password}) => User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password);
}
