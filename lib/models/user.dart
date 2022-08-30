import 'package:new_vvvvid/models/products.dart';

class User {
  final int id;
  final String username;
  final String password;
  final String profilePicUrl;
  String? bio;
  List<String>? favouriteCharacters;
  List<Products>? favouriteProducts;
  List<Products>? guardaPiuTardi;
  List<Products>? continuaAGuardare;
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
    required this.id,
    required this.username,
    required this.password,
    required this.profilePicUrl,
    this.bio,
    this.favouriteCharacters,
    this.favouriteProducts,
    this.guardaPiuTardi,
    this.continuaAGuardare,
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
