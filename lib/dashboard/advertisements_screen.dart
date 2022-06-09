import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/advertisement_bloc.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ad.getTitle(),
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff152D93),
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: bloc.title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintText: "Titulo del anuncio",
                    fillColor: Colors.white70),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: bloc.content,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintText: "Contenido del anuncio",
                    fillColor: Colors.white70),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await bloc.updateAdvertisements();
                    Navigator.pop(context);
                  },
                  child: Text('Guardar Cambios'),
                ),
              ),
            ],
          ),
        ));
  }
}

class _SoccerAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
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
                      "Bienvenido",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Color(0xFF152D93),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Nan",
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
                    onTap: (() => print("On taop")),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(""),
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
  Size get preferredSize => const Size.fromHeight(80);
}
