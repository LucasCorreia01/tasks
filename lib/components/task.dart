import 'package:flutter/material.dart';
import 'package:tasks/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String imagem;
  final int dificuldade;
  Task(
      {required this.nome,
      required this.imagem,
      required this.dificuldade,
      super.key});

  int nivel = 0;
  int nivelExp = 0;


  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  static const List<Color> listColors = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.black
  ];

  bool assetOrNetwork() {
    if (widget.imagem.contains('http')) {
      return false;
    }

    return true;
  }


  @override
  Widget build(BuildContext context) {
    double nivelMaximo = (widget.nivel / widget.dificuldade) / 10;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: listColors[widget.nivelExp],
                borderRadius: BorderRadius.circular(4)),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(4)),
                      child: assetOrNetwork()
                          ? Image.asset(
                              widget.imagem,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              widget.imagem,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                          Difficulty(dificuldade: widget.dificuldade)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (nivelMaximo == 1) {
                                if (widget.nivelExp < 4) {
                                  widget.nivelExp++;
                                }
                                widget.nivel = 1;
                              } else {
                                widget.nivel++;
                              }
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: (widget.nivel / widget.dificuldade) / 10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nível: ${widget.nivel}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ])
            ],
          ),
        ],
      ),
    );
  }
}
