import 'package:flutter/material.dart';
import 'package:eventura/telas/inicio.dart';

void main() {
  runApp(
    // Colocando o provider, ele se tornar um fornecedor da minha repofavs para o meu MyApp
    // ChangeNotifierProvider(
  // create: (context)=> repofavs(),
  //child: 
  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVENTURA', // Coloca um nome para o aplicativo
      theme: ThemeData( // Define o estilo e tema da aplicação 
        ),
      home: const inicio(), // Seta a pagina principal que irá aparecer quando iniciar a aplicação
    );
  }
}