import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:team_soccer_coach/bloc/event_bloc.dart';
import 'package:team_soccer_coach/widgets/soccer_button.dart';

enum ImageSourceType { gallery, camera }

class AddEventScreen extends StatefulWidget {
  const AddEventScreen._();
  static Widget init() {
    return ChangeNotifierProvider(
      create: (_) => EventBLoC(eventServices: GetIt.I.get<EventServices>()),
      builder: (_, __) => const AddEventScreen._(),
    );
  }

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final ImagePicker _picker = ImagePicker();
  DateTime? pickedDate;
  TimeOfDay? timeOfDay;
  XFile? _imageFile;

  void _setImageFileListFromFile(XFile? value) {
    _imageFile = value;
  }

  _getFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: null,
      );
      setState(() {
        _setImageFileListFromFile(pickedFile);
      });
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final bloc = Provider.of<EventBLoC>(context, listen: false);
    DateTime currentDate = DateTime.now();
    pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(currentDate.year),
        lastDate: DateTime(currentDate.year + 1));

    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate!;
      });
      bloc.controllerFecha.text =
          DateFormat.yMMMMEEEEd('es').format(currentDate);
    }
  }

  Future<void> _selectTime(BuildContext context, bool type) async {
    final bloc = Provider.of<EventBLoC>(context, listen: false);
    TimeOfDay? selectedTime = TimeOfDay.now();
    timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
      if (!mounted) return;
      if (type) {
        bloc.controllerDesde.text = selectedTime!.format(context);
      } else {
        bloc.controllerHasta.text = selectedTime!.format(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<EventBLoC>();
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: _SoccerAppBar(),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                width: 414,
                height: 274,
                child: Stack(children: [
                  Semantics(
                    label: 'image_picker_example_picked_images',
                    child: _imageFile != null
                        ? Image.file(
                            File(_imageFile!.path),
                            width: 414,
                            height: 274,
                            fit: BoxFit.contain,
                          )
                        : Placeholder(),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _getFromGallery();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Icon(Icons.photo),
                      ),
                    ),
                  )
                ]),
              ),
              _CardItem(
                  height: 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tipo de evento: *",
                        style: TextStyle(
                            color: Color(0xff4E4957),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                          value: bloc.dropdownValue,
                          items: ["Seleccione", "Entrenamiento", "Partido"]
                              .map((String value) {
                            return DropdownMenuItem(
                                value: value,
                                child:
                                    SizedBox(width: 200, child: Text(value)));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              bloc.dropdownValue = newValue!;
                            });
                          }),
                      const Text("Lugar: *",
                          style: TextStyle(
                              color: Color(0xff4E4957),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                          controller: bloc.controllerLugar,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10))),
                      const Text("Fecha: *",
                          style: TextStyle(
                              color: Color(0xff4E4957),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                          controller: bloc.controllerFecha,
                          onTap: () => _selectDate(context),
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10))),
                      const Text("Desde: *",
                          style: TextStyle(
                              color: Color(0xff4E4957),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                          controller: bloc.controllerDesde,
                          onTap: () => _selectTime(context, true),
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10))),
                      const Text("Hasta: *",
                          style: TextStyle(
                              color: Color(0xff4E4957),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                          controller: bloc.controllerHasta,
                          onTap: () => _selectTime(context, false),
                          readOnly: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10))),
                      const Text("Nota:",
                          style: TextStyle(
                              color: Color(0xff4E4957),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                        controller: bloc.controllerNota,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10)),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Center(
                          child: SoccerButton(
                              onTap: () => {
                                    if (_imageFile?.path != null)
                                      {bloc.createEvent(File(_imageFile!.path))}
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Agregué una imagen")))
                                      }
                                  },
                              text: "Añadir Evento"),
                        ),
                      )
                    ],
                  )),
            ],
          ),
          Positioned.fill(child: Builder(
            builder: ((context) {
              switch (bloc.state) {
                case EventState.loading:
                  return Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                case EventState.success:
                  return AlertDialog(
                      title: const Text('Soccer App'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('Se añadio correctamente este evento.'),
                          ],
                        ),
                      ));

                case EventState.error:
                  return AlertDialog(
                      title: const Text('Soccer App'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('Hubo un error añadiendo este evento.'),
                            Text(
                                'Asegurese de llenar todo el fomulario, y vuelva a intentarlo'),
                          ],
                        ),
                      ));

                default:
                  return const SizedBox.shrink();
              }
            }),
          ))
        ]),
      ),
    );
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
            padding:
                const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Añadir",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xFF152D93),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Evento",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xFFFE9402),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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

class _CardItem extends StatelessWidget {
  final Widget child;
  final double height;
  const _CardItem({required this.child, required this.height});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Container(
        height: height,
        margin: const EdgeInsets.all(10),
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: child,
          ),
        ),
      ),
    );
  }
}
