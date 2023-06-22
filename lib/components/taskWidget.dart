import 'package:flutter/material.dart';
import 'package:tasks/components/difficultyWidget.dart';
import 'package:tasks/data/inheritedWidgetTasks.dart';

class Task extends StatefulWidget {
  final String nameTask;
  final String urlImage;
  final int difficulty;
  Task(
      {required this.nameTask,
      required this.urlImage,
      required this.difficulty,
      super.key});
  int level = 0;
  int indexColor = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  double? levelMax;

  static const List<Color> listColors = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    levelMax = (widget.level / widget.difficulty) / 10;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: listColors[widget.indexColor],
                borderRadius: BorderRadius.circular(8)),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          child: (widget.urlImage.contains('http'))
                              ? Image.network(
                                  widget.urlImage,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset('assets/images/nophoto.png'),
                                )
                              : Image.asset(
                                  widget.urlImage,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset('assets/images/nophoto.png'),
                                )),
                    ),
                    SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nameTask,
                              style: const TextStyle(
                                  fontSize: 26,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            DifficultyWidget(widget.difficulty)
                          ],
                        )),
                    SizedBox(
                      height: 46,
                      width: 54,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (levelMax == 1.0) {
                                widget.level = 0;
                                if (widget.indexColor < 4) {
                                  widget.indexColor++;
                                }
                              } else {
                                widget.level++;
                                InheritedWidgetTasks.of(context)
                                    .incrementTotalValue(widget.difficulty);
                              }
                            });
                          },
                          child: Column(
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text('UP')
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.level / widget.difficulty) / 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível: ${widget.level}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
