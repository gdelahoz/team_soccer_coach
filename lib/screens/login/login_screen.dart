import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/screens/home/home_screen.dart';
import 'package:team_soccer_coach/widgets/soccer_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen._();

  static Widget init() {
    return ChangeNotifierProvider(
      create: (_) => null,
      builder: (_, __) => const LoginScreen._(),
    );
  }

  void login(String email, String pass, BuildContext context) async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen.init()));
    /* final bloc = Provider.of<PersonBLoC>(context, listen: false);
    try {
      final user = await bloc.login();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen.init(user)));
    } catch (e) {
      final messageError = e.toString().split("]");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(messageError[1].trim())));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Stack(
          children: [
            Container(
              color: Colors.blueAccent,
            ),
            Center(
                child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 450,
              width: 450,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("TEAM UP \n SOCCER  \n COACH",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.person_outline,
                              color: Theme.of(context).iconTheme.color)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(
                            Icons.lock_clock_sharp,
                            color: Theme.of(context).iconTheme.color!,
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(25),
                        child: SoccerButton(
                            text: 'Login',
                            onTap: () => login("email", "pass", context)))
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
            )),
            /* Positioned.fill(
                child: (bloc.state == LoginState.loading)
                    ? Container(
                        color: Colors.black26,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox.shrink())*/
          ],
        ))
      ]),
    );
  }
}
