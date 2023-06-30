// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:tasks/components/taskWidget.dart';
import 'package:tasks/data/inheritedWidgetTasks.dart';
import 'package:tasks/data/task_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});
  final dynamic taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              height: 650,
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 3, color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira um nome para a tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        hintStyle: TextStyle(fontSize: 18),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) < 1 ||
                            int.parse(value) > 5) {
                          return 'Insira um valor de 1 a 5';
                        }
                        return null;
                      },
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        hintStyle: TextStyle(fontSize: 18),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Isira uma url de imagem!';
                        }
                        return null;
                      },
                      controller: imageController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        hintStyle: TextStyle(fontSize: 18),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      keyboardType: TextInputType.url,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 75,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/images/nophoto.png'),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskDao().save(Task(
                              nameTask: nameController.text,
                              urlImage: imageController.text,
                              difficulty:
                                  int.parse(difficultyController.text)));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Criando nova tarefa.')));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Adicionar',
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
