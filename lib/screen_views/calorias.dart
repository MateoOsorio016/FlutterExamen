import 'package:flutter/material.dart';



class calorias_input extends StatelessWidget {
   final ValueNotifier<String> dropdownValue;
  final List<String> opciones;
  const calorias_input({
    Key? key,
    required this.dropdownValue,
    required this.opciones,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: dropdownValue,
      builder: (context, value, child) {
        return DropdownButton<String>(
          value: value,
          items: opciones.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 25),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            dropdownValue.value = newValue!;
            print(newValue);
          },
        );
      },
    );
  }
}


