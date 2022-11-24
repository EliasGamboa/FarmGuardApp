import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Animal extends StatelessWidget {
  final String image, name;

  Animal({super.key, required this.image, required this.name});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(name)),
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
          const SizedBox(
            height: 25,
          ),
          Image.network(image, width: 200, height: 200),
          const SizedBox(
            height: 25,
          ),
          const Text('Nombre'),
          const SizedBox(
            height: 25,
          ),
          _textFieldName(),
          const SizedBox(
            height: 25,
          ),
          const Text('# de jaula'),
          const SizedBox(
            height: 25,
          ),
          const Text('Cantidad'),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
                width: 150,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Correcto'),
                            content: const Icon(
                              Icons.assignment_turned_in_outlined,
                              color: Colors.green,
                              size: 100,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: (() {
                                    Navigator.popAndPushNamed(context, 'area');
                                  }),
                                  child: const Text('Aceptar'))
                            ],
                          );
                        });
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.green),
                    alignment: Alignment.center,
                  ),
                  child: const AutoSizeText(
                    'Todo bien',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                width: 150,
                child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red),
                        alignment: Alignment.center),
                    onPressed: () {
                      Navigator.pushNamed(context, 'incidencia');
                    },
                    child: const AutoSizeText(
                      'Incidencia',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          )
        ],
      )),
    );
  }

  Widget _textFieldName() {
    return Container(
        color: Colors.grey,
        height: 30,
        margin: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Text(name));
  }
}
