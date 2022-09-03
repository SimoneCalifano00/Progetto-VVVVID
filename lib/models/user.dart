import 'package:new_vvvvid/models/characters.dart';
import 'package:new_vvvvid/models/genere.dart';
import 'package:new_vvvvid/models/products.dart';

class User {
  final int id;
  final String username;
  final String password;
  String profilePicUrl;
  String localPic;
  String bio = "Personalizza il tuo profilo, inserisci una bio!";
  List<Character>? favouriteCharacters;
  List<Products>? favouriteProducts;
  final List<Products> guardaPiuTardi;
  final List<Products> continuaAGuardare;
  List<User>? friendList;

  List<Generi>? generi = [
    Generi(nome: 'Avventura', rating: 0),
    Generi(nome: 'Seinen', rating: 0),
    Generi(nome: 'Shonen', rating: 0),
    Generi(nome: 'Comico', rating: 0),
    Generi(nome: 'Azione', rating: 0),
    Generi(nome: 'Fantascienza', rating: 0),
    Generi(nome: 'Fantasy', rating: 0),
    Generi(nome: 'Horror', rating: 0),
    Generi(nome: 'Thriller', rating: 0),
    Generi(nome: 'Supereroistico', rating: 0),
  ];

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.profilePicUrl,
    this.localPic = "",
    required this.bio,
    this.favouriteCharacters,
    this.favouriteProducts,
    required this.guardaPiuTardi,
    required this.continuaAGuardare,
    this.friendList,
    this.generi,
  });
}
