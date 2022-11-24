import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Incidencia extends StatefulWidget {
  const Incidencia({super.key});

  @override
  State<Incidencia> createState() => _IncidenciaState();
}

class _IncidenciaState extends State<Incidencia> {
  var incidencias = [
    'Seleccione Incidencia',
    'Falta comida y/o agua',
    'Animal herido',
    'Animal fallecido',
    'Animal enfermo',
    'Otro, especificar'
  ];
  String _predeterminada = 'Seleccione Incidencia';
  var image;
  final picker = ImagePicker();
  Future selImage(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else if (op == 2) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text('No tomo ninguna imagen'),
                content: Text('Seleccione una imagen o tome una foto'),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incidencia')),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.grey], stops: [0.2, 0.8]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/images/user.png',
              scale: 15,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text('Menganito Perez'),
            const SizedBox(
              height: 25,
            ),
            const Text('Guardia'),
            const SizedBox(
              height: 25,
            ),
            const Text('Area X'),
            const SizedBox(
              height: 350,
            ),
            const Text('Cerrar Sesión')
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  value: _predeterminada,
                  items: incidencias
                      .map((String e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _predeterminada = value!;
                    });
                  },
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        selImage(1);
                      },
                      icon: Icon(Icons.camera_alt),
                      iconSize: 50,
                    ),
                    IconButton(
                      onPressed: () {
                        selImage(2);
                      },
                      icon: Icon(Icons.photo),
                      iconSize: 50,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
                width: 250,
                height: 250,
                child: image == null ? Center() : Image.file(image)),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 70,
              width: 180,
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                      alignment: Alignment.center),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Incidencia Reportada'),
                            content: const Icon(
                              Icons.assignment_turned_in_outlined,
                              color: Colors.green,
                              size: 100,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: (() {
                                    Navigator.popAndPushNamed(
                                        context, 'animal');
                                  }),
                                  child: const Text('Aceptar'))
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'Incidencia',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
