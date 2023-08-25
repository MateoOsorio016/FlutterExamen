import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class Ejercicio extends StatefulWidget {
  const Ejercicio({super.key});

  @override
  State<Ejercicio> createState() => _EjercicioState();
}

class _EjercicioState extends State<Ejercicio> {
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
          _buildCard(
            'https://www.youtube.com/watch?v=8TX-LRZ8pyw', // Reemplaza con el ID del video de YouTube
            'Pecho y Brazos',
          ),
          _buildCard(
            'https://www.youtube.com/watch?v=X7TxM5XztXM', // Reemplaza con el ID del video de YouTube
            'Espalda y Hombro',
          ),
               _buildCard(
            'https://www.youtube.com/watch?v=l-tyGdgLRCE', // Reemplaza con el ID del video de YouTube
            'Pierna ',
          ),

          // Agrega más cartas aquí
        ],
      ),
    );
  }

  Widget _buildCard(String videoId, String description) {
    return Center(
      child: Card(
        child: Container(
          width: 250,
          child: Column(
            children: [
              YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId,
                ),
                aspectRatio: 16 / 9,
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
