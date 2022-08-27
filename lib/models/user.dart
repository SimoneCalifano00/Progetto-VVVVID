import 'package:new_vvvvid/models/products.dart';

class User {
  final String username;
  final String password;
  String? profilePicUrl;
  String? bio;
  List<String>? favouriteCharacters;
  List<Products>? favouriteProducts;
  List<User>? friendList;

  User(
      {required this.username,
      required this.password,
      this.profilePicUrl,
      this.bio,
      this.favouriteCharacters,
      this.favouriteProducts,
      this.friendList});
}
