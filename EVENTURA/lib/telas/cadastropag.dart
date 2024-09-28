import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart'; 

// ignore: camel_case_types
class cadastro extends StatefulWidget {
  const cadastro({super.key});

  @override
  cadastroState createState() => cadastroState();
}

// ignore: camel_case_types
class cadastroState extends State<cadastro> {
  // ignore: non_constant_identifier_names
  final Infos = GlobalKey<FormState>();

  // declara as variaveis 
  String nome = '';
  String email = '';
  String senha = '';

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFB2A5D4), // Adiona um cor ao fundo da aplicação 
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Coloca um icone de usuario a aplicação 
            children: <Widget>[
               const Icon(
                Icons.person_2_outlined,
                size: 100,
                color: Colors.white,
              ),

              // Cria uma caixa de texto para apresentação 
              const SizedBox(height: 16),
              const Text(
                'SEJA BEM VINDO(A)',
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

              // Adiona um form pra a entrada de texto
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: Infos,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Nome'),

                  // Se o valor for null(vazio/nada) ele ira dar um aviso falando para adicionar algum texto
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu Nome';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            nome = value!;
                          },
                        ),

                        TextFormField(
                          decoration: const InputDecoration(labelText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira um email';
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
                              return 'insira uma senha';
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
                                  builder: (context) => const login()),
                            );
                          },

                    // Adiona um text pequena embaixo do form para o não cadastrado
                          child: const Text(
                            'Já tem conta? Faça o login',
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600
                            ),
                          ),
                        ),

                    // Feito a entrada de texto no form, ele direciona o usuario a pag home atraves do MaterialPageRoute
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (Infos.currentState!.validate()) {
                              Infos.currentState!.save();
                              // Processa o nome, email e senha do novo usuario 
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