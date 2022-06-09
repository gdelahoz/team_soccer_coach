import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/team_bloc.dart';
import 'package:team_soccer_coach/screens/team/add_player.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen._();

  static Widget init() {
    return ChangeNotifierProvider(
      create: (_) =>
          TeamBLoC(eventServices: GetIt.I.get<TeamServices>())..getTeam(),
      builder: (_, __) => const TeamScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<TeamBLoC>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "ADD PLAYER",
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPlayerScreen.init())).then((value) {
            bloc.getTeam();
          });
        },
        child: const Icon(Icons.person_add),
      ),
      backgroundColor: const Color(0xFFE5E5E5),
      body: Column(
        children: [
          bloc.myTeam.getTrainers().isNotEmpty
              ? Expanded(
                  child: bloc.myTeam.getTrainers().isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return _ItemTeam(
                                team: bloc.myTeam?.getTrainers(),
                                type: "Entrenadores");
                          })
                      : SizedBox.shrink(),
                )
              : SizedBox.shrink(),
          bloc.myTeam.getArchers().isNotEmpty
              ? Expanded(
                  child: bloc.myTeam.getArchers().isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return _ItemTeam(
                                team: bloc.myTeam.getArchers(),
                                type: "Arqueros");
                          })
                      : SizedBox.shrink(),
                )
              : SizedBox.shrink(),
          bloc.myTeam.getDefenses().isNotEmpty
              ? Expanded(
                  child: bloc.myTeam.getDefenses().isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return _ItemTeam(
                                team: bloc.myTeam.getDefenses(),
                                type: "Defensores");
                          })
                      : SizedBox.shrink(),
                )
              : SizedBox.shrink(),
          bloc.myTeam.getMidfielder().isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return _ItemTeam(
                            team: bloc.myTeam.getMidfielder(),
                            type: "MedioCampistas");
                      }),
                )
              : SizedBox.shrink(),
          bloc.myTeam.getStrikers().isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return _ItemTeam(
                            team: bloc.myTeam.getStrikers(),
                            type: "Delanteros");
                      }),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _ItemTeam extends StatelessWidget {
  final List<Person>? team;
  final String type;
  const _ItemTeam({Key? key, required this.team, required this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SizedBox(
            width: double.infinity,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff152D93),
                            fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: team?.length,
                          itemBuilder: (context, index) {
                            return _ItemText(data: team?[index]);
                          })
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class _ItemText extends StatelessWidget {
  final Person? data;

  _ItemText({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (false)
          Icon(Icons.copyright, color: Color(0xff4E4957))
        else
          SizedBox.shrink(),
        SizedBox(
          width: 4,
        ),
        Text(
          data?.getFullName() ?? "Nan",
          style: TextStyle(color: Color(0xff4E4957)),
        ),
      ],
    );
  }
}
