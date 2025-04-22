import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Presentationsnackbarscreen extends StatelessWidget {
  const Presentationsnackbarscreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: 16,),
        Center(child: Text("MV barra de Snacks", style: GoogleFonts.ultra(color: Colors.blueGrey, fontSize: 40, fontWeight: FontWeight.w600),)),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16), // Padding solo en los lados
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 10),
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
                child: Image.asset("assets/mvSnacks.png", width: 320, height: 320, fit: BoxFit.cover,),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textLarge("¡Dale un Toque Único a Tu Fiesta con Nuestro Exclusivo Servicio de Barra de Snacks a Domicilio!"),
                    SizedBox(height: 10,),
                    textLarge("¿Estás buscando una forma creativa y deliciosa de impresionar a tus invitados en tu próxima fiesta? Nuestro servicio de barra de snacks a domicilio es la solución perfecta para añadir ese toque especial que tu evento necesita. Con una amplia variedad de toppings salados, dulces y saludables, nos aseguramos de que cada vasito de snack sea una experiencia inolvidable."),
                    SizedBox(height: 10,),
                    textLarge("Contamos con la más alta calidad y frescura en nuestras barras de snacks en CDMX: Nos enorgullecemos decirte que solo utilizamos los ingredientes más frescos. Nuestros snacks no solo son deliciosos, sino también saludables, lo que significa que puedes disfrutar sin remordimientos. Además de que habrá una inmensa variedad de dulces y golosinas para que tu evento sea un éxito. Somos «LA TOPPINGUERÍA»")
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Text("MV barra de Snacks", style: GoogleFonts.varta(color: Colors.blueGrey, fontSize: 40, fontWeight: FontWeight.w600),),
        SizedBox(height: 20,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              circularImageBorder('assets/mvSnacks.png', context),
              SizedBox(width: 16,),
              circularImageBorder('assets/mvSnacks.png', context),
              SizedBox(width: 16,),
              circularImageBorder('assets/mvSnacks.png', context)
            ],
          ),
        )
      ],
    );
  }

  Widget circularImageBorder(image, context){
    double size = MediaQuery.of(context).size.width * 0.3;
   return Container(
     height: size,
     width: size,
     decoration: BoxDecoration(
       border: Border.all(color: Colors.blueGrey, width: 10),
       shape: BoxShape.circle,
       image: DecorationImage(
         image: AssetImage(image),
         fit: BoxFit.cover,
       ),
     ),
   );
  }

  Widget textLarge(text){
   return Text(
        text,
        softWrap: true, 
        overflow: TextOverflow.visible,
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600));
  }
}
