import 'package:flutter/material.dart';
import 'cadastropag.dart';
import 'home.dart';


// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});
 // Define o widget de estado
  @override
  loginState createState() => loginState(); // Cria uma instância que gere o widget
}

// ignore: camel_case_types
class loginState extends State<login> {
  final infos = GlobalKey<FormState>(); // é uam chave global para indentificar o form e o estado 

  // Declara as variaveis 
  String email = ''; 
  String senha = '';

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2A5D4), // Use the background color from the image
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.person_2_outlined,
                size: 100,
                color: Colors.white,
              ),


                // Adiciona um texto embaixo do icone
              const SizedBox(height: 16),  
              const Text(
                'BEM VINDO(A) DE VOLTA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Adiciona uma Box para colocar o Form
            const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.all(16.0),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: infos,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[


                        // Adiona um form pra a entrada de texto
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          
                          // Se o valor for null(vazio/nada) ele ira dar um aviso falando para adicionar algum texto
                          validator: (value) {
                            if (value == null || value.isEmpty) { 
                              return 'insira seu email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Senha'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira sua senha';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            senha = value!;
                          },
                        ),

                        // Adiciona um child text para que a pessoa que não tem conta, acessar a pag de cadastro.
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const cadastro()),
                            );
                          },
                          // Adiona um text pequena embaixo do form para o não cadastrado
                          child: const Text(
                            'Não tem conta? Faça o cadastro',
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600   ),
                          ),
                        ),

                        // Feito a entrada de texto no form, ele direciona o usuario a pag home atraves do MaterialPageRoute
                        const SizedBox(height: 20),
                        ElevatedButton( // Cria um botão para ir a pag home
                          onPressed: () {
                            if (infos.currentState!.validate()) {
                              infos.currentState!.save();
                              // Processa o email e senha
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            }
                          },
                       child: const Text('Logar'),
                          style: ElevatedButton.styleFrom(
                             side: BorderSide(width: 2.5, color: Color(0xFFB2A5D4))
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}