import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData.light(),
      home: const MyHomePage(title: 'ToDo App'),
    );
  }
}

//class model for todo
class todo_list {
  String title;
  String description;
  todo_list(this.title, this.description);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Creating variable user input and array to be inserted
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  List<todo_list> _todoList = [];

  void _addTodoItem() {
    setState(() {
      String titleText = titleController.text;
      String descriptionText = descriptionController.text;
      _todoList.add(todo_list(titleText, descriptionText));
    });
    print(_todoList[0].title);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
              width: 3,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the title',
                  ),
                  controller: titleController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the description',
                  ),
                  controller: descriptionController,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  scrollDirection: Axis.vertical,
                  itemCount: _todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Todo ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Title: ${_todoList[index].title}',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Description: ${_todoList[index].description}',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.lightBlueAccent,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
              ),
              FlatButton(
                minWidth: 700,
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: _addTodoItem,
              )
            ],
          ),
        ),
      ),
    );
  }
}