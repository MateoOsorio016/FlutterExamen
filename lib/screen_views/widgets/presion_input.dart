import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_views/dietas.dart';
import 'package:flutter_application_1/screen_views/presion.dart';


// ignore: must_be_immutable
class Presion extends StatefulWidget {

const Presion({Key? key}) : super(key: key);

  @override
  State<Presion> createState() => _PresionState();
}

class _PresionState extends State<Presion> {
  TextEditingController presion = TextEditingController();
  final result= TextEditingController();
  int resultado=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presion'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child:  Column(
        children: [
      Inputs(hintText: "Presion", labelText: "Ingrese la presion", controller: presion,),
      TextField(
        controller: result,
        enabled: false,
        obscureText: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Presion: ",
        ),
      ),
      IconButton(
  icon: const Icon(Icons.remove),
  onPressed: () {
    setState(() {
      double presiones = double.tryParse(presion.text) ?? 0.0;
      if(presiones <= 120){
        result.text='Normal';
      }else if(presiones > 120 && presiones <= 129){
        result.text='Presión arterial alta (sin otros factores de riesgo cardíaco)';
      }else if(presiones > 129 && presiones <= 179){
        result.text='Presión arterial alta (con otros factores de riesgo cardíaco, según algunos proveedores)';
      }else{
        result.text='Presión arterial peligrosamente alta - Busque atención médica de inmediato';
      }
     
    });
  },
),
      ]
    )
      )
    )  
    );
  }
}