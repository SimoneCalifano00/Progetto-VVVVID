import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_vvvvid/main.dart';
import 'package:new_vvvvid/models/dummy_users.dart';
import 'package:new_vvvvid/models/genere.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/login_screen.dart';

class RegistrazioneScreen extends StatefulWidget {
  const RegistrazioneScreen({Key? key}) : super(key: key);

  @override
  State<RegistrazioneScreen> createState() => _RegistrazioneScreenState();
}

class _RegistrazioneScreenState extends State<RegistrazioneScreen> {
  bool checkForSameUsername(String username) {
    User same =
        DUMMY_USERS.firstWhere((element) => element.username == username);
    if (same.username.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  User _registrazione(String username, String password) {
    User newUser = User(
      id: 15,
      username: username,
      password: password,
      profilePicUrl:
          'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/default-user-image.png',
      bio: "La tua bio è vuota, se vuoi, tocca l'icona qui sopra per cambiarla",
      guardaPiuTardi: [],
      continuaAGuardare: [],
      favouriteCharacters: [],
      favouriteProducts: [],
      friendList: [],
      generi: [
        Generi(nome: 'Avventura', rating: 0),
        Generi(nome: 'Seinen', rating: 0),
        Generi(nome: 'Shonen', rating: 0),
        Generi(nome: 'Comico', rating: 0),
        Generi(nome: 'Azione', rating: 0),
        Generi(nome: 'Fantascienza', rating: 0),
        Generi(nome: 'Drammatico', rating: 0),
        Generi(nome: 'Fantasy', rating: 0),
        Generi(nome: 'Horror', rating: 0),
        Generi(nome: 'Thriller', rating: 0),
        Generi(nome: 'Supereroistico', rating: 0)
      ],
      localPic: '',
    );
    setState(() {
      DUMMY_USERS.add(newUser);
    });
    return newUser;
  }

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  void showToast(String errMex) {
    Fluttertoast.showToast(
        msg: errMex,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }

  void _submitRegistrazione() {
    final usernameInput = _usernameController.text;
    final passwordInput = _passwordController.text;
    final passwordConfirmInput = _passwordConfirmController.text;

    final User currUser;

    if (usernameInput.isEmpty) {
      showToast('Impossibile inserire uno username vuoto');
      return;
    }

    if (usernameInput.length < 3 || usernameInput.length > 19) {
      showToast('Lo username deve contenere fra i 3 e i 19 caratteri');
      return;
    }

    if (passwordInput.isEmpty) {
      showToast('Impossibile inserire una password vuota');
      return;
    }

    if (passwordConfirmInput != passwordInput) {
      showToast(
          "La password di conferma deve corrispondere alla prima password inserita");
      return;
    }

    /* if (checkForSameUsername(usernameInput) == false) {
      showToast(
          'Lo username inserito è già stato utilizzato, ne scelga un altro');
      return;
    } */

    currUser = _registrazione(usernameInput, passwordConfirmInput);

    print(currUser.username);
    print(currUser.password);
    print(currUser.profilePicUrl);

    /*pushNewScreenWithRouteSettings(context,
            screen: MyHomePage(),
            settings:
                RouteSettings(name: MyHomePage.routePath, arguments: currUser));*/
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage(currUser)));
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: _displayHeight * 0.08),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      iconSize: _displayWidth * 0.1,
                    ),
                  ),
                ],
              ),
              Container(
                  width: _displayWidth * 0.42,
                  height: _displayHeight * 0.12,
                  child: Image.asset('lib/assets/imgs/LogoVVVVID.jpg'),
                  alignment: Alignment.center),
              SizedBox(
                height: _displayHeight * 0.02,
              ),
              Text(
                'Inserisca i suoi dati dove richiesti',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: _displayHeight * 0.075,
              ),
              Padding(
                padding: EdgeInsets.only(left: _displayWidth * 0.04),
                child: TextField(
                  onSubmitted: (_) => _submitRegistrazione(),
                  controller: _usernameController,
                  cursorColor: const Color.fromARGB(255, 252, 56, 98),
                  decoration: InputDecoration(
                      labelText: "Username...",
                      labelStyle: Theme.of(context).textTheme.headline4,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      border: InputBorder.none,
                      isDense: true),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(
                height: _displayHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: _displayWidth * 0.04),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  onEditingComplete: _submitRegistrazione,
                  cursorColor: const Color.fromARGB(255, 252, 56, 98),
                  decoration: InputDecoration(
                      labelText: "Password...",
                      labelStyle: Theme.of(context).textTheme.headline4,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      border: InputBorder.none,
                      isDense: true),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(
                height: _displayHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: _displayWidth * 0.04),
                child: TextField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  onEditingComplete: _submitRegistrazione,
                  cursorColor: const Color.fromARGB(255, 252, 56, 98),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: _submitRegistrazione,
                          icon: Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.white),
                          iconSize: 20),
                      labelText: "Password di conferma...",
                      labelStyle: Theme.of(context).textTheme.headline4,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      border: InputBorder.none,
                      isDense: true),
                  style: Theme.of(context).textTheme.bodyText2,
                  onSubmitted: (_) => _submitRegistrazione(),
                ),
              ),
              SizedBox(height: _displayHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
