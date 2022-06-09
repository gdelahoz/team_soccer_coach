import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/home_bloc.dart';
import 'package:team_soccer_coach/dashboard/dashboard_screen.dart';
import 'package:team_soccer_coach/screens/events/event_screen.dart';
import 'package:team_soccer_coach/screens/team/team_screen.dart';
import 'package:team_soccer_coach/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen._();

  static Widget init() {
    return ChangeNotifierProvider(
      create: (_) => HomeBLoC(),
      builder: (_, __) => const HomeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomeBLoC>();
    return Scaffold(
      appBar: _SoccerAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: bloc.indexSelected,
              children: [
                DashboardScreen.init(),
                EventScreen.init(),
                TeamScreen.init()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _SoccerNavigationBar(),
    );
  }
}

class _SoccerNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomeBLoC>();
    return BottomNavigationBar(
        selectedItemColor: SoccerColors.blueColor,
        currentIndex: bloc.indexSelected,
        onTap: (index) => bloc.updateIndexSelected(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Eventos"),
          BottomNavigationBarItem(icon: Icon(Icons.shield), label: "Equipo"),
        ]);
  }
}

class _SoccerAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomeBLoC>();
    return Material(
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bloc.firstText.isEmpty ? "Bienvenido" : bloc.firstText,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Color(0xFF152D93),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bloc.secondText.isEmpty ? "Entrenador" : bloc.secondText,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Color(0xFFFE9402),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                ClipOval(
                  child: InkWell(
                    splashColor: Color(0xFFFE9402),
                    onTap: (() => print("On tap")),
                    child: const CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage("https://instagram.fctg1-3.fna.fbcdn.net/v/t51.2885-19/205932112_667865500749914_356908178677727680_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fctg1-3.fna.fbcdn.net&_nc_cat=102&_nc_ohc=fur6EvrS6OUAX9FPUoa&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT89tfKM-u33Qz0dbsEldsZfUYTvETZoKF4inmqzimIDvA&oe=62A7EE38&_nc_sid=8fd12b"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
