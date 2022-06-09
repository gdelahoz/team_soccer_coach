import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/advertisement_bloc.dart';
import 'package:team_soccer_coach/dashboard/advertisements_screen.dart';
import 'package:team_soccer_coach/theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen._();
  static Widget init() {
    return ChangeNotifierProvider(
      create: (_) => AdvertisementBLoC(
          advertisementServices: GetIt.I.get<AdvertisementServices>())
        ..getAdvertisement(),
      builder: (_, __) => const DashboardScreen._(),
    );
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdvertisementBLoC>();
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Column(
        children: [
          _ItemCard(
            advertisements: bloc.adv,
          )
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  Advertisements? advertisements;
  _ItemCard({Key? key, required this.advertisements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AdvertisementBLoC>();

    return InkWell(
      splashColor: Color(0xFFFE9402),
      onTap: (() => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AdvertisementsScreen.init(advertisements!)))
          .then((value) => bloc.getAdvertisement())),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(runSpacing: 10,children: [
          Text('Anuncio',
            style: TextStyle(
              color: SoccerColors.blueColor, 
              fontSize: 24,
              fontWeight: FontWeight.bold
            )),
          Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        advertisements?.getTitle() ?? "Titulo anuncio",
                        style: TextStyle(
                            fontSize: 18,
                            color: SoccerColors.blueColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        advertisements?.getContent() ?? "Contenido",
                        style:
                            TextStyle(fontSize: 16, color: SoccerColors.grey),
                      )
                    ],
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
