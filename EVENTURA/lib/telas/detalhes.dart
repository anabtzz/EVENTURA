import 'package:flutter/material.dart';
import 'package:eventura/model/evento.dart';
import 'package:url_launcher/url_launcher.dart';

class PagDetalhes extends StatelessWidget {
  final Evento evento;



  _launchURL(Uri url) async {
    if(!await launchUrl(url)) {
      throw Exception('Não foi possivel acessar o site');
    }
  }

  const PagDetalhes({Key? key, required this.evento}) : super(key: key);
  

  @override

  //faz uma barra em cima com a pag que o usuario entrou 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: const Padding(

           // nome da pagina que o usuario entrou  
          padding: EdgeInsets.only(top: 8.0),
          child: Text('Detalhes Sobre:', 
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 0, 0, 0)
                ),
            ),
        ),
        centerTitle: true,
        ),
      

      // coloca um icone, nome, data e descrição do evento selecionado 
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              evento.icone,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              evento.nome,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 10),
            Text(
              evento.data,
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                evento.descri,
                style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                evento.obs,
                style: TextStyle(fontSize: 17, 
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),

            // cria um botao que vai direto no site oficial do evento 
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // foreground
                backgroundColor: Color(0xFF9E9ECE), // background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                // Ação ao clicar no botão
                 _launchURL(evento.link);
              },
              child: Text('Saber Mais'),
            ),
          ],
        ),
      ),
    );
  }
}
