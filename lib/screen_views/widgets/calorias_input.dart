import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_views/calorias.dart';
import 'package:flutter_application_1/screen_views/imc.dart';

// ignore: must_be_immutable
class Calorias extends StatefulWidget {

const Calorias({Key? key}) : super(key: key);

  @override
  State<Calorias> createState() => _CaloriasState();
}

class _CaloriasState extends State<Calorias> {
  ValueNotifier<String> dropdownValue = ValueNotifier<String>('Hombre'); // Inicializar el ValueNotifier
  TextEditingController desayuno = TextEditingController();
  TextEditingController almuerzo= TextEditingController();
  TextEditingController cena= TextEditingController();

  final result= TextEditingController();
  int resultado=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorias'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child:  Column(
          children: [
          calorias_input(
        dropdownValue: dropdownValue,
        opciones: const ['Hombre', 'Mujer'],
      ),
      Inputs(hintText: "Desayuno", labelText: "Calorias del Desayuno", controller: desayuno,),
      Inputs(hintText: "Almuerzo", labelText: "Caloriad del Almuerzo uwu", controller: almuerzo,),
      Inputs(hintText: "Cena", labelText: "Calorias de la cena uwu", controller: cena,),

      TextField(
        controller: result,
        enabled: false,
        obscureText: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Resultado: ",
        ),
      ),
      IconButton(
        icon: const Icon(Icons.remove),
        onPressed: (){
          setState(() {
            int caloriasDesayuno = int.tryParse(desayuno.text) ?? 0;
            int caloriasAlmuerzo = int.tryParse(almuerzo.text) ?? 0;
            int caloriasCena = int.tryParse(cena.text) ?? 0;
          resultado= caloriasDesayuno + caloriasAlmuerzo + caloriasCena;
          String genero= dropdownValue.value;
          result.text=resultado.toString();
          if (genero=='Mujer' && resultado<=1600){
            result.text='Consumo Inferior';
          }else if (genero=='Mujer' && resultado>1600 && resultado<=2000){
            result.text='Consumo normal';
          }else{
            result.text='Consumo Excesivo';
          }
          if (genero=='Hombre' && resultado<=1600){
            result.text='Defisit Calorico';
          }else if (genero=='Hombre' && resultado>2000 && resultado<=2500){
            result.text='Consumo normal';
          }else{
            result.text='Consumo Excesivo';
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