import 'package:flutter/material.dart';
import 'package:tasks/data/task_dao.dart';
import 'package:tasks/screens/formScreen.dart';
import 'package:tasks/data/inheritedWidgetTasks.dart';
import 'package:tasks/components/taskWidget.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  var globalLevel = 0;

  Future<void> _reloadList() async {
    var reload = await Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
  }

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
              children: [
                SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: InheritedWidgetTasks.of(context).globalLevel / 100,
                  ),
                ),
                Text(
                    'Level: ${InheritedWidgetTasks.of(context).globalLevelString}')
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: RefreshIndicator(
          onRefresh: _reloadList,
          child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Não há nenhuma tarefa',
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  print(snapshot.hasData);
                  return const Text('Error ao carregar tarefas');
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
                print('Recarregando a tela inicial');
              }));

          //Navegação nomeada: passo o contexto para o app conseguir salvar a tarefa
          // Navigator.of(context)
          //     .pushNamed('/create-task', arguments: context)
          //     .then((value) {
          //   setState(() {
          //     print('Recarregando a tela inicial');
          //   });
          // });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
