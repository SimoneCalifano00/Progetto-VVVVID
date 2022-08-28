import 'package:new_vvvvid/models/products.dart';

class User {
  final String username;
  final String password;
  String? profilePicUrl;
  String? bio;
  List<String>? favouriteCharacters;
  List<Products>? favouriteProducts;
  List<User>? friendList;
  int? avventura;
  int? comico;
  int? azione;
  int? drammatico;
  int? fantascienza;
  int? fantasy;
  int? horror;
  int? thriller;
  int? supereroistico;

  User({
    required this.username,
    required this.password,
    this.profilePicUrl,
    this.bio,
    this.favouriteCharacters,
    this.favouriteProducts,
    this.friendList,
    this.avventura,
    this.comico,
    this.drammatico,
    this.fantascienza,
    this.fantasy,
    this.horror,
    this.azione,
    this.supereroistico,
    this.thriller,
  });
}
