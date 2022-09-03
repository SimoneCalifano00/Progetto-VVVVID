import 'package:new_vvvvid/models/characters.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/models/genere.dart';
import 'package:new_vvvvid/models/user.dart';

final DUMMY_USERS = [
  User(
    id: 1,
    username: 'IcoOfSeele',
    password: '1234',
    bio:
        "Mi piace giocare ai videogiochi nel tempo libero, sono su questa app principalmente per guardare Anime!",
    profilePicUrl:
        'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic1.jpg',
    continuaAGuardare: [
      DUMMY_PRODUCTS.firstWhere((product) => product.id == 1)
    ],
    generi: [
      Generi(nome: 'Avventura', rating: 31),
      Generi(nome: 'Seinen', rating: 21),
      Generi(nome: 'Shonen', rating: 34),
      Generi(nome: 'Comico', rating: 17),
      Generi(nome: 'Azione', rating: 22),
      Generi(nome: 'Fantascienza', rating: 1),
      Generi(nome: 'Fantasy', rating: 4),
      Generi(nome: 'Horror', rating: 3),
      Generi(nome: 'Thriller', rating: 3),
      Generi(nome: 'Supereroistico', rating: 1)
    ],
    guardaPiuTardi: [],
    localPic: "",
    friendList: [],
    favouriteCharacters: [
      Character(
          name: 'Killua Zoldyck ',
          characterPic:
              'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/killuaPic.jpg',
          bio: ''),
      Character(
        name: 'Vash the Stampede ',
        characterPic:
            'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/vashPic.jpg',
        bio: '',
      ),
    ],
    favouriteProducts: [
      DUMMY_PRODUCTS.firstWhere((product) => product.id == 1),
    ],
  ),
  User(
      id: 2,
      username: 'AverageFan',
      password: '1234',
      continuaAGuardare: [],
      bio: "Scemo chi legge",
      localPic: "",
      favouriteProducts: [],
      favouriteCharacters: [],
      generi: [
        Generi(nome: 'Avventura', rating: 31),
        Generi(nome: 'Seinen', rating: 21),
        Generi(nome: 'Shonen', rating: 34),
        Generi(nome: 'Comico', rating: 17),
        Generi(nome: 'Azione', rating: 22),
        Generi(nome: 'Fantascienza', rating: 1),
        Generi(nome: 'Fantasy', rating: 4),
        Generi(nome: 'Horror', rating: 3),
        Generi(nome: 'Thriller', rating: 3),
        Generi(nome: 'Supereroistico', rating: 1)
      ],
      guardaPiuTardi: [],
      friendList: [],
      profilePicUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic2.jpg'),
  User(
      id: 3,
      username: 'BlackSwordsman',
      password: '1234',
      bio: "Sono il massimo esperto di Videogiochi, anime e serie tv",
      localPic: "",
      continuaAGuardare: [],
      guardaPiuTardi: [],
      favouriteProducts: [],
      favouriteCharacters: [],
      generi: [
        Generi(nome: 'Avventura', rating: 31),
        Generi(nome: 'Seinen', rating: 21),
        Generi(nome: 'Shonen', rating: 34),
        Generi(nome: 'Comico', rating: 17),
        Generi(nome: 'Azione', rating: 22),
        Generi(nome: 'Fantascienza', rating: 1),
        Generi(nome: 'Fantasy', rating: 4),
        Generi(nome: 'Horror', rating: 3),
        Generi(nome: 'Thriller', rating: 3),
        Generi(nome: 'Supereroistico', rating: 1)
      ],
      friendList: [],
      profilePicUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic3.png'),
  User(
      id: 4,
      username: 'Francesca',
      password: '1234',
      bio:
          "Ciao! mi piace personalizzare il profilo e sono una dei due Attori su cui si basa questo progetto!",
      localPic: "",
      continuaAGuardare: [],
      guardaPiuTardi: [],
      favouriteProducts: [],
      favouriteCharacters: [],
      generi: [
        Generi(nome: 'Avventura', rating: 31),
        Generi(nome: 'Seinen', rating: 21),
        Generi(nome: 'Shonen', rating: 34),
        Generi(nome: 'Comico', rating: 17),
        Generi(nome: 'Azione', rating: 22),
        Generi(nome: 'Fantascienza', rating: 1),
        Generi(nome: 'Fantasy', rating: 4),
        Generi(nome: 'Horror', rating: 3),
        Generi(nome: 'Thriller', rating: 3),
        Generi(nome: 'Supereroistico', rating: 1)
      ],
      friendList: [],
      profilePicUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic4.jpg'),
];
