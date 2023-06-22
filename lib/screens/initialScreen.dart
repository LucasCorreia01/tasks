import 'package:flutter/material.dart';
import 'package:tasks/screens/formScreen.dart';
import 'package:tasks/data/inheritedWidgetTasks.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  var globalLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        // leading: Container(),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tarefas'),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                 SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: InheritedWidgetTasks.of(context).globalLevel / 100,
                  ),
                ),
                Text('Level: ${InheritedWidgetTasks.of(context).globalLevelString}')
              ],
            )
          ],
        ),
      ),
      body: ListView(children: InheritedWidgetTasks.of(context).tasks),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          //Navegação nomeada: passo o contexto para o app conseguir salvar a tarefa
          Navigator.of(context).pushNamed('/create-task', arguments: context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
