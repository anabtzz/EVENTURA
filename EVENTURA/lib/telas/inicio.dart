import 'package:flutter/material.dart';
import 'cadastropag.dart';

class inicio extends StatelessWidget {
  const inicio({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFB2A5D4),
        body: Center( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[  
              // Aumentando a logo
              Image.asset(
                'icon/logo 2.png',
                width: 350, // Ajuste a largura conforme necessário
                height: 300, // Ajuste a altura conforme necessário
                 // Para manter a proporção
              ), 
              const SizedBox(height: 50),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(                      
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const cadastro()),
                    );
                  },
                  label: const Text('CONTINUAR'),
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
            ],  
          ),
        ),
      ),
    );
  }
}