import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_views/dietas.dart';
import 'package:flutter_application_1/screen_views/imc.dart';


// ignore: must_be_immutable
class IMC extends StatefulWidget {

const IMC({Key? key}) : super(key: key);

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  final result= TextEditingController();
  int resultado=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child:  Column(
        children: [
      Inputs(hintText: "Peso", labelText: "Ingrese el peso", controller: peso,),
      Inputs(hintText: "Cantidad", labelText: "Ingrese la altura", controller: altura,),
      TextField(
        controller: result,
        enabled: false,
        obscureText: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "IMC: ",
        ),
      ),
      IconButton(
  icon: const Icon(Icons.remove),
  onPressed: () {
    setState(() {
      double pesoValue = double.tryParse(peso.text) ?? 0.0;
      double alturaValue = double.tryParse(altura.text) ?? 0.0;

      if (alturaValue > 0) {
        double imc = pesoValue / (alturaValue * alturaValue);
        result.text = imc.toStringAsFixed(2);

        if (imc < 18.5) {
          result.text = "$imc: inferior al normal";
        } else if (imc >= 18.5 && imc <= 24.9) {
          result.text = "$imc: Peso Normal";
        } else if (imc > 24.9 && imc <= 29.9) {
          result.text = "$imc: Peso superior al normal";
        } else if (imc > 29.9) {
          result.text = "$imc: Obesidad";
        }
      } else {
        result.text = "Altura inválida";
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