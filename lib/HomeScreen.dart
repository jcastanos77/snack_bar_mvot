import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snack_bar_app/GaleriaScreen.dart';
import 'package:snack_bar_app/PresentationDrinksBarScreen.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

import 'package:snack_bar_app/PresentationSnackBarScreen.dart';

import 'PaquetesSnackBarScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  ScrollController _scrollController = ScrollController();
  Color _appBarColor = Colors.transparent;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 50) {
      setState(() {
        _appBarColor = Colors.black;
      });
    } else {
      setState(() {
        _appBarColor = Colors.transparent;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  bool isMobileBrowser() {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains("mobile") || userAgent.contains("android") || userAgent.contains("iphone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text('MV & OTMB', style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.w600)),
          ),
          backgroundColor: _appBarColor.withOpacity(0.8),
          elevation: 0,
          actions: isMobileBrowser() ? [
            PopupMenuButton<String>(
              onSelected: (value) {
                print("Seleccionaste: $value");
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(value: "perfil", child: Text("Barra de Snacks")),
                  PopupMenuItem(value: "ajustes", child: Text("Barra de Bebidas")),
                  PopupMenuItem(value: "cerrarSesion", child: Text("Lista de toppings")),
                  PopupMenuItem(value: "contacto", child: Text("Contacto")),
                ];
              },
            ),
          ] : [
            TextButton(
                onPressed: (){

            }, child: Text("Barra de Snacks", style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500),)),
            TextButton(
                onPressed: (){

                }, child: Text("Barra de Bebidas", style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500))),
            TextButton(
                onPressed: (){

                }, child: Text("Lista de toppings", style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500))),
            TextButton(
                onPressed: (){

                }, child: Text("Contacto", style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('MV Snack Bar', style: GoogleFonts.atma(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 50)),
                Text('&', style: GoogleFonts.atma(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 50)),
                Text('OtroTrago Mobile Bar', style: GoogleFonts.atma(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 50))
                ],),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
                image: const DecorationImage(
                  image: AssetImage('assets/principalImage.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.black12, width: 1),
              ),
            ),
            SizedBox(height: 16,),
            Presentationsnackbarscreen(),
            SizedBox(height: 16,),
            Presentationdrinksbarscreen(),
            SizedBox(height: 16,),
            Paquetessnackbarscreen(),
            Text("Nuestra galeria", style: GoogleFonts.atma(color: Colors.blueGrey, fontWeight: FontWeight.w600, fontSize: 50),),
            Galeriascreen()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchWhatsApp,
        child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white,),
        backgroundColor: Colors.green,
      ),
    );
  }

  final String phone = '+526442366993'; // número en formato internacional
  final String message = 'Hola, quiero más información';

  void _launchWhatsApp() async {
    final url = 'https://wa.me/${phone.replaceAll('+', '')}?text=${Uri.encodeComponent(message)}';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir WhatsApp';
    }
  }
}
