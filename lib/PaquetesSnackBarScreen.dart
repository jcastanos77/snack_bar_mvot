import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Paquetessnackbarscreen extends StatefulWidget {
  const Paquetessnackbarscreen({super.key});

  @override
  State<Paquetessnackbarscreen> createState() => _PaquetessnackbarscreenState();
}

class _PaquetessnackbarscreenState extends State<Paquetessnackbarscreen> {
  final List<Map<String, dynamic>> tarjetas = [
    {
      'titulo':'Barra de snacks',
      'numero': 1,
      'detalles': [
        '13 Toppings a elegir',
        '2 horas de servicio',
        'Vasos',
        'Salsas'
      ],
    },
    {
      'titulo':'Barra de bebidas',
      'numero': 2,
      'detalles': [
        '10 Toppings a elegir',
        '1 hora y media de servicio',
        'Servilletas',
      ],
    },
    {
      'titulo':'Barra de snacks y bebidas',
      'numero': 3,
      'detalles': [
        '8 Toppings',
        '1 hora de servicio',
        'Incluye cucharitas',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFE29A),
                Color(0xFFFFB6B9),
                Color(0xFFB5EAD7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                Text(
                  'Paquetes',
                  style:  GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 160,
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 110,
                  child: Text(
                    'elige tus paquetes',
                    style:  GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: tarjetas.map((tarjeta) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${tarjeta['titulo']}',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          '${tarjeta['numero']}',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Mostramos todos los detalles dinámicamente
                        ...List.generate(
                          tarjeta['detalles'].length,
                              (i) => Text(
                              "•" + " "+tarjeta['detalles'][i],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
