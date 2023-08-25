import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          _buildCard('images/paleo_diet_microbiota.png', 'DIETA PALEO: Se basa en llevar un estilo de alimentación similar a la que llevaban nuestros antepasados en el paleolítico. En aquella época eran cazadores-recolectores y la alimentación se basaba en carnes, pescados, huevos, semillas, frutos secos, vegetales y frutas principalmente. Se excluye de esta dieta cualquier procesado o ultra procesado, así como cereales, lácteos y legumbres. Una dieta de este estilo bien planificada puede ser una buena opción para perder grasa corporal y así adelgazar, sobre todo para aquellas personas que tienen desequilibrios hormonales como resistencia a la insulina'),
          _buildCard('images/ciclado.png', 'CICLADO DE CARBOHIDRATOS: En este tipo de dieta se tiene en cuenta el consumo de carbohidratos dependiendo del día de la semana. Sobre todo, su consumo disminuye los días que no hay entrenamiento físico y aumenta los días de entrenamiento. Este tipo de dieta bien planificada puede ser muy útil para aquellas personas que quieran bajar de peso y entrenen 2-3 días a la semana o aquellas personas que quieran mejorar su rendimiento deportivo.'),
          _buildCard('images/descarga.jfif', 'AYUNO INTERMITENTE: En este tipo de alimentación se realizan distintos ayunos, los más empleados son de 12-16 horas en donde no se ingieren kcal, tan solo líquidos acalóricos. Este tipo de alimentación bien diseñada puede ser muy beneficiosa para aquellas personas que quieran perder grasa corporal, que les sienta bien hacer pocas comidas al día o no desayunar; otros de sus beneficios son ayudar a prevenir el envejecimiento de nuestras células y mejorar el estado físico de las personas diabéticas tipo 2.'),
           _buildCard('images/PiramideAlimentos.jpg', 'DIETA MEDITERRÁNEA EQUILIBRADA: Este tipo de alimentación incluye todos los grupos alimenticios de la pirámide nutricional, se basa en la ingesta media-alta de carbohidratos y grasas, y una ingesta suficiente de proteínas (en torno al 15-20%). Una dieta de este estilo bien diseñada con un déficit calórico moderado se recomienda para aquellas personas que quieran perder grasa y no presenten ningún tipo de desequilibrio hormonal. Es una dieta muy llevadera y nutritiva, por normal general no requiere de suplementación.'),

          // Agrega más cartas aquí
        ],
      ),
    );
  }

  Widget _buildCard(String imageUrl, String description) {
    return Center(
      child: Card(
        child: Container(
          width: 250, 
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10), 
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
