import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/advertisement_bloc.dart';
import 'package:team_soccer_coach/dashboard/advertisements_screen.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Wrap(children: [
          Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        advertisements?.getTitle() ?? "",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF152D93),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        advertisements?.getContent() ?? "",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff4E4957)),
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
