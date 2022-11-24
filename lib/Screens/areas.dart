import 'dart:convert';

import 'package:farm_guard/Screens/animal.dart';
import 'package:farm_guard/models/photos.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Area extends StatefulWidget {
  const Area({super.key});

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
  late Future<List<Photos>> _listPhotos;

  Future<List<Photos>> _getPhotos() async {
    final res = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=9n440bmPiJXjQJu7wM7YAQnAddDOBXQJ&limit=10&rating=g'));
    List<Photos> photos = [];
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      for (var item in data['data']) {
        photos.add(Photos(item['title'], item['images']['original']['url']));
      }
    } else {
      throw Exception("Fallo conexion");
    }
    return photos;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listPhotos = _getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area X'),
      ),
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
      body: FutureBuilder(
        future: _listPhotos,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: _list(snapshot.data),
            );
          } else if (snapshot.hasError) {
            const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  List<Widget> _list(data) {
    List<Widget> photos = [];

    for (var item in data) {
      photos.add(Card(
        child: Column(
          children: [
            Expanded(
                child: GestureDetector(
              child: Image.network(
                item.url,
                fit: BoxFit.fill,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Animal(
                          image: item.url,
                          name: item.name,
                        )));
              },
            )),
          ],
        ),
      ));
    }
    return photos;
  }
}
