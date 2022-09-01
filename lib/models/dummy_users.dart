import 'package:new_vvvvid/models/dummy_products.dart';
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
    guardaPiuTardi: [],
  ),
  User(
      id: 2,
      username: 'AverageFan',
      password: '1234',
      continuaAGuardare: [],
      bio: "",
      guardaPiuTardi: [],
      profilePicUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic2.jpg'),
  User(
      id: 3,
      username: 'BlackSwordsman',
      password: '1234',
      bio: "",
      continuaAGuardare: [],
      guardaPiuTardi: [],
      profilePicUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic3.png'),
  User(
      id: 4,
      username: 'Francesca',
      password: '1234',
      bio: "",
      continuaAGuardare: [],
      guardaPiuTardi: [],
      profilePicUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/profile-pic4.jpg'),
];
