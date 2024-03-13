import 'package:flutter/material.dart';
import 'package:flutterapp/Constants/api.dart';
import 'package:flutterapp/Models/todo.dart';
import 'package:flutterapp/Widgets/todo_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutterapp/Widgets/app_bar.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int done = 0;
  List<Todo> myTodos = [];
  bool isLoading = true;
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      data.forEach((todo) {
        Todo t = Todo(
          id: todo['id'],
          title: todo['title'],
          desc: todo['desc'],
          isdone: todo['isdone'],
          date: todo['date'],
        );
        if (todo['isdone']){
          done += 1;
        }
        myTodos.add(t);
      });
      print(myTodos.length);

      setState(() {
        isLoading = false;
      });
      // print(response.body);
    } catch (e) {
      print("Error is $e");
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff001133),
        appBar: customAppBar(),
        body:
          //   PieChart(
          //     dataMap: {
          //     "Done": done.toDouble(),
          //     "Incomplete": (myTodos.length = done).toDouble()
              
          //     }

          //   ),
             isLoading
            ? CircularProgressIndicator()
            : ListView(
                children: myTodos.map((e) {
                  return TodoContainer(
                    id: e.id,
                    title: e.title,
                    desc: e.desc,
                    isdone: e.isdone,
                  );
                }).toList(),
              )
    );
  }
}
