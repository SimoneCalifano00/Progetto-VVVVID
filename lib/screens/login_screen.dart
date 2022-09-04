import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/main.dart';
import 'package:new_vvvvid/models/dummy_users.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_vvvvid/screens/registrazione_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  static const routePath = '/Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User _login(String username, String password) {
    final currUser = DUMMY_USERS.firstWhere(
        (user) => user.username == username && user.password == password);
    return currUser;
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  /*void startLogin(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: ,
            behavior: HitTestBehavior.opaque,
          );
        });
  }*/

  void showToast(String errMex) {
    Fluttertoast.showToast(
        msg: errMex,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    void _submitLogin() {
      final usernameInput = _usernameController.text;
      final passwordInput = _passwordController.text;

      final User currUser;

      if (usernameInput.isEmpty) {
        showToast('Impossibile inserire uno username vuoto');
        return;
      }

      if (passwordInput.isEmpty) {
        showToast('Impossibile inserire una password vuota');
        return;
      }

      currUser = _login(usernameInput, passwordInput);

      print(currUser.username);
      print(currUser.password);
      print(currUser.profilePicUrl);

      if (currUser == null) {
        showToast('Username o Password errata');
      } else {
        /*pushNewScreenWithRouteSettings(context,
            screen: MyHomePage(),
            settings:
                RouteSettings(name: MyHomePage.routePath, arguments: currUser));*/
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyHomePage(currUser)));
      }
    }

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _displayWidth * 0.04,
                vertical: _displayHeight * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: _displayWidth * 0.42,
                    height: _displayHeight * 0.12,
                    child: Image.asset('lib/assets/imgs/LogoVVVVID.jpg'),
                    alignment: Alignment.center),
                SizedBox(
                  height: _displayHeight * 0.02,
                ),
                Text(
                  'Salve, e benvenuto su VVVVID. Il portale italiano e legale di Streaming per Anime, Serie TV e Film.',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _displayHeight * 0.02,
                ),
                Text(
                  'Se è registrato, inserisca i dati richiesti in basso',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _displayHeight * 0.075,
                ),
                TextField(
                  onSubmitted: (_) => _submitLogin(),
                  controller: _usernameController,
                  cursorColor: const Color.fromARGB(255, 252, 56, 98),
                  decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: Theme.of(context).textTheme.headline4,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      border: InputBorder.none,
                      isDense: true),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: _displayHeight * 0.04,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  onEditingComplete: _submitLogin,
                  cursorColor: const Color.fromARGB(255, 252, 56, 98),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: _submitLogin,
                          icon: Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.white),
                          iconSize: 20),
                      labelText: "Password",
                      labelStyle: Theme.of(context).textTheme.headline4,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      border: InputBorder.none,
                      isDense: true),
                  style: Theme.of(context).textTheme.bodyText2,
                  onSubmitted: (_) => _submitLogin(),
                ),
                SizedBox(height: _displayHeight * 0.05),
                Text(
                  'Altrimenti, tocca qui per essere riportato alla schermata di registrazione',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: _displayHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegistrazioneScreen()));
                  },
                  child: Text('Registrazione'),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 252, 56, 98)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
