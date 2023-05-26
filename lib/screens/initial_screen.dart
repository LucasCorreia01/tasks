import 'package:flutter/material.dart';
import 'package:tasks/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: const Text('Tarefa'),
            ),
            body: AnimatedOpacity(
              opacity: (opacidade) ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              child: ListView(children: const [
                Task(
                  nome: 'Aprender Flutter',
                  imagem: 'assets/images/dash.png',
                  dificuldade: 3,
                ),
                Task(
                  nome: 'Andar de bike',
                  imagem: 'assets/images/bike.webp',
                  dificuldade: 2,
                ),
                Task(
                  nome: 'Ler',
                  imagem: 'assets/images/livro.jpg',
                  dificuldade: 5,
                ),
                Task(
                  nome: 'Meditar',
                  imagem: 'assets/images/meditar.jpeg',
                  dificuldade: 4,
                ),
                Task(
                  nome: "Jogar",
                  imagem: 'assets/images/jogar.jpg',
                  dificuldade: 1,
                ),
                SizedBox(
                  height: 80,
                )
              ]
                    ),
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;              
            });
          }, 
          child: const Icon(Icons.remove_red_eye),
        ),
      );
  }
}