import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/player_bloc.dart';

class AddPlayerScreen extends StatefulWidget {
  AddPlayerScreen._();

  static Widget init() {
    return ChangeNotifierProvider(
      create: (_) => PlayerBLoC(playerServices: GetIt.I.get<PersonServices>()),
      builder: (_, __) => AddPlayerScreen._(),
    );
  }

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  DateTime? pickedDate;

  Future<void> _selectDate(BuildContext context) async {
    final bloc = Provider.of<PlayerBLoC>(context, listen: false);
    DateTime currentDate = DateTime.now();
    pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: currentDate);

    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate!;
      });
      bloc.dateOfBirthController.text =
          DateFormat.yMMMMEEEEd('es').format(currentDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PlayerBLoC>();
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text("Añadir Jugador"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _CardItem(
                height: 100,
                child: Center(
                  child: CircleAvatar(
                    child: Container(child: Text("P")),
                    radius: 40,
                  ),
                )),
            _CardItem(
                height: 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Información personal",
                      style: TextStyle(
                          color: Color(0xff152D93),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Nombre:",
                      style: TextStyle(
                          color: Color(0xff4E4957),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: bloc.nameController,
                      keyboardType: TextInputType.text,
                    ),
                    const Text(
                      "Apellidos:",
                      style: TextStyle(
                          color: Color(0xff4E4957),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: bloc.lastNameController,
                      keyboardType: TextInputType.text,
                    ),
                    const Text("Correo:",
                        style: TextStyle(
                            color: Color(0xff4E4957),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      controller: bloc.emailController,
                      keyboardType: TextInputType.text,
                    ),
                    const Text("Telefono:",
                        style: TextStyle(
                            color: Color(0xff4E4957),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      controller: bloc.cellphoneController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                )),
            _CardItem(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Información fisica",
                      style: TextStyle(
                          color: Color(0xff152D93),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Altura:",
                      style: TextStyle(
                          color: Color(0xff4E4957),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: bloc.heigthController,
                      keyboardType: TextInputType.number,
                    ),
                    const Text("Peso:",
                        style: TextStyle(
                            color: Color(0xff4E4957),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      controller: bloc.weigthController,
                      keyboardType: TextInputType.number,
                    ),
                    const Text("Fecha de nacimiento:",
                        style: TextStyle(
                            color: Color(0xff4E4957),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      onTap: () => _selectDate(context),
                      readOnly: true,
                      controller: bloc.dateOfBirthController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                height: 260),
            _CardItem(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Datos del jugador",
                      style: TextStyle(
                          color: Color(0xff152D93),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Posición:",
                      style: TextStyle(
                          color: Color(0xff4E4957),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                        value: bloc.dropdownValue,
                        items: [
                          "Seleccione",
                          "Entrenador",
                          "Arquero",
                          "Defensor",
                          "MedioCampista",
                          "Delantero"
                        ].map((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: SizedBox(width: 200, child: Text(value)));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.dropdownValue = newValue!;
                          });
                        }),
                    const Text("Posición secundaria:",
                        style: TextStyle(
                            color: Color(0xff4E4957),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    DropdownButton<String>(
                        value: bloc.seconddropdownValue,
                        items: [
                          "Seleccione",
                          "Entrenador",
                          "Arquero",
                          "Defensor",
                          "MedioCampista",
                          "Delantero"
                        ].map((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: SizedBox(width: 200, child: Text(value)));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.seconddropdownValue = newValue!;
                          });
                        }),
                    const Text("Dorsal:",
                        style: TextStyle(
                            color: Color(0xff4E4957),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextField(
                      controller: bloc.dorsarlController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                height: 260),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await bloc.registerPlayer();
                    Navigator.of(context).pop();
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: const Text("Registrar Jugador")),
            const SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final Widget child;
  final double height;
  const _CardItem({required this.child, required this.height});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Container(
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: child,
          ),
        ),
        height: height,
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
