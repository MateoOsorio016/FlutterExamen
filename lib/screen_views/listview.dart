import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_views/dietas.dart'; // Importa tus vistas aquí
import 'package:flutter_application_1/screen_views/widgets/dietas_input.dart';
import 'package:flutter_application_1/screen_views/widgets/calorias_input.dart';
import 'package:flutter_application_1/screen_views/ejercicios.dart';
import 'package:flutter_application_1/screen_views/widgets/presion_input.dart';
import 'package:flutter_application_1/screen_views/contacto.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<Map<String, dynamic>> items = [
    {'name': 'Dietas', 'image': 'images/2843539.png'},
    {'name': 'IMC', 'image': 'images/unnamed.png'},
    {'name': 'Calorias', 'image': 'images/TABLEAU-CALORIES.jpg'},
    {'name': 'Rutinas', 'image': 'images/ejer.png'},
    {'name': 'Presion Arterial', 'image': 'images/descarga.png'},
    {'name': 'Contacto', 'image': 'images/1b0612bca0cd99911b17c88392db70ca-icono-de-contacto-de-soporte-al-cliente.png'},
  ];

  Map<String, Widget> routes = {
    'Dietas': const CartScreen(),
    'IMC': const IMC(),
    'Calorias': const Calorias(),
    'Rutinas': const Ejercicio(),
    'Presion Arterial': const Presion(),
    'Contacto': const ContactPage()

  };

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My list"),
        backgroundColor: const Color.fromARGB(255, 214, 159, 159),
      ),
      body: Column(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(''), // Agrega la URL de la imagen aquí
                  fit: BoxFit.cover)),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => routes[item['name']]!),
                  );
                },
                title: Text(
                  item['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(item['image'])),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              );
            },
          ),
        ),
      ]),
    );
  }
}
