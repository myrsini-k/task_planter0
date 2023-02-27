import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:camera/camera.dart';
import 'home.dart';
import 'main.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class MyFormPage extends StatelessWidget {
  MyFormPage({Key? key, required this.title}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final String title;
  late String label;
  late String frequency;
  late DateTime duedate;
  late String mood;
  String location = 'home';
  //TextEditingController label = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 184, 133),
          child: SafeArea(
              child: SingleChildScrollView(
            child: FastForm(
              formKey: formKey,
              children: [
                FastFormSection(
                  // header: const Text('Add Task'),
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    FastTextField(
                      onSaved: (value) {
                        label = value.toString();
                      },
                      name: 'task_label',
                      labelText: 'Task Label',
                      placeholder: 'Enter Task',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    FastDatePicker(
                      backgroundColor: Colors.green,
                      onSaved: (value) {
                        if (value != null) duedate = value;
                      },
                      name: 'due_date',
                      labelText: 'Due date',
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    ),
                    FastDropdown<String>(
                      dropdownColor: const Color.fromARGB(255, 255, 184, 133),
                      onSaved: (value) {
                        frequency = value.toString();
                      },
                      name: 'dropdown',
                      labelText: 'Frequency',
                      items: const ['Once', 'Daily', 'Weekly', 'Monthly'],
                      initialValue: 'Once',
                    ),
                    FastDropdown<String>(
                      dropdownColor: const Color.fromARGB(255, 255, 184, 133),
                      onChanged: (value2) {
                        location = value2.toString();
                      },
                      name: 'dropdown_loc',
                      labelText: 'Location',
                      items: const ['Home', 'Uni', 'Work'],
                      initialValue: 'Home',
                    ),
                    FastRadioGroup<String>(
                      onSaved: (value) {
                        mood = value.toString();
                      },
                      name: 'radio_group',
                      labelText: 'Mood picker',
                      options: const [
                        FastRadioOption(text: 'Happy', value: 'happy'),
                        FastRadioOption(text: 'Sad', value: 'sad'),
                        FastRadioOption(text: 'Relaxed', value: 'relaxed'),
                        FastRadioOption(text: 'Stressed', value: 'stressed'),
                      ],
                    ),
                    TextButton(
                        style: ButtonStyle(),
                        child: const Text('Submit'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            tasks.add(Task(
                                id: idcounter,
                                name: label,
                                completed: "no",
                                duedate: "",
                                location: location,
                                frequency: frequency,
                                mood: mood));
                            idcounter = idcounter + 1;

                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PageViewDemo()),
                            );
                          }
                        }),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}

class TaskPage extends StatelessWidget {
  static final String home = 'Tasks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                index = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageViewDemo()),
                );
              },
              child: const Icon(
                Icons.home,
                size: 40,
                color: Color(0xFF2E5627),
              ),
            ),
            centerTitle: true,
            title: const Text('Task List', style: TextStyle(fontSize: 34))),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cat3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                TaskList(),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        heroTag: "btn1",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyFormPage(
                                      title: "Add New Task",
                                    )),
                          );
                        },
                        backgroundColor: const Color(0xFFB3F39B),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xFF2E5627),
                        )),
                    SizedBox(
                      width: 200,
                    ),
                    FloatingActionButton(
                        heroTag: "btn2",
                        onPressed: () {
                          ;
                        },
                        backgroundColor: const Color(0xFFB3F39B),
                        child: const Icon(Icons.filter_list_alt,
                            color: Color(0xFF2E5627)))
                  ],
                )
              ],
            )),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.checklist_rtl),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today),
                label: home,
                backgroundColor: const Color(0xFFB3F39B),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.spa_outlined),
                  label: home,
                  backgroundColor: const Color(0xFFB3F39B)),
              BottomNavigationBarItem(
                icon: const Icon(Icons.emoji_emotions_outlined),
                label: home,
                backgroundColor: const Color(0xFFB3F39B),
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: 1,
            selectedItemColor: const Color(0xFF022100),
            unselectedItemColor: const Color(0xFF2E5627),
            iconSize: 40,
            onTap: (curr) {
              index = curr;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageViewDemo()),
              );
            },
            //onTap: _onItemTapped,
            elevation: 5));
  }
}

class Task {
  int id;
  String name, completed, duedate, location, frequency, mood;
  Task(
      {required this.id,
      required this.name,
      required this.completed,
      required this.duedate,
      required this.location,
      required this.frequency,
      required this.mood});
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.topCenter,
            color: const Color.fromARGB(255, 255, 184, 133),
            width: 350,
            height: 520,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: tasks.map((personone) {
                    IconData comIcon;
                    if (personone.completed == "yes") {
                      comIcon = Icons.check_box;
                    } else {
                      comIcon = Icons.check_box_outline_blank;
                    }

                    return Container(
                      child: Card(
                        child: ListTile(
                          title: Text(
                            personone.name,
                          ),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                  width: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.greenAccent),
                                    child: Icon(
                                      comIcon,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      final tile = tasks.firstWhere(
                                          ((item) => item.id == personone.id));
                                      if (tile.completed == "no") {
                                        //εδω κανονικα εμφανιζεται παραθυρο για ληψη εικονας και εχει επιλογη skip
                                      }
                                      setState(() => tile.completed = 'yes');
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent),
                                    child: const Icon(
                                      Icons.delete,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      //delete action for this button
                                      tasks.removeWhere((element) {
                                        return element.id == personone.id;
                                      }); //go through the loop and match content to delete from list
                                      setState(() {
                                        //refresh UI after deleting element from list
                                      });
                                    },
                                  ),
                                )
                              ]),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )));
  }
}
