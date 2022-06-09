import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/advertisement_bloc.dart';
import 'package:team_soccer_coach/theme.dart';

class AdvertisementsScreen extends StatelessWidget {
  AdvertisementsScreen._({required this.ad});
  Advertisements ad;
  static Widget init(Advertisements ad) {
    return ChangeNotifierProvider(
      create: (_) => AdvertisementBLoC(advertisementServices: GetIt.I.get())
        ..getAdvertisement(),
      builder: (_, __) => AdvertisementsScreen._(
        ad: ad,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdvertisementBLoC>();
    return Scaffold(
        appBar: _SoccerAppBar(),
        backgroundColor: const Color(0xFFE5E5E5),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ad.getTitle(),
                    style: TextStyle(
                        fontSize: 20,
                        color: SoccerColors.blueColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: bloc.title,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        filled: true,
                        hintText: "Titulo del anuncio",
                        fillColor: Colors.white70),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: bloc.content,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        filled: true,
                        hintText: "Contenido del anuncio",
                        fillColor: Colors.white70),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(SoccerColors.white),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text('Regresar', style: TextStyle(color: SoccerColors.yellowColor)),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(SoccerColors.yellowColor),
                        ),
                        onPressed: () async {
                          await bloc.updateAdvertisements();
                          Navigator.pop(context);
                        },
                        child: const Text('Guardar cambios'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _SoccerAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
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
                      "Editar",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: SoccerColors.blueColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Anuncio",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: SoccerColors.yellowColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                ClipOval(
                  child: InkWell(
                    splashColor: Color(0xFFFE9402),
                    onTap: (() => print("On taop")),
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
