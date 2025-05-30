import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'home.dart';
import 'task.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> heavyImpact() async {
  await SystemChannels.platform.invokeMethod<void>(
    'HapticFeedback.vibrate',
    'HapticFeedbackType.heavyImpact',
  );
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture for this task')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFB3F39B),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(
          Icons.camera_alt,
          color: const Color(0xFF2E5627),
        ),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PageViewDemo())),
        backgroundColor: const Color(0xFFB3F39B),
        child: const Icon(
          Icons.task_outlined,
          color: const Color(0xFF2E5627),
        ),
      ),
    );
  }
}

var cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  // camera:  firstCamera;
  tasks.add(Task(
      id: idcounter,
      name: "Plant tree",
      type: "plant4",
      completed: "no",
      duedate: DateTime.utc(2024, 6, 6),
      location: "home",
      frequency: "daily",
      mood: "happy"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      id: idcounter,
      name: "Water plants",
      type: "plant1",
      completed: "yes",
      duedate: DateTime.utc(2023, 10, 6),
      location: "home",
      frequency: "daily",
      mood: "calm"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      id: idcounter,
      type: "plant2",
      name: "Finish report",
      completed: "no",
      duedate: DateTime.utc(2023, 6, 14),
      location: "uni",
      frequency: "once",
      mood: "stressed"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      type: "plant2",
      id: idcounter,
      name: "Work out",
      completed: "yes",
      duedate: DateTime.utc(1944, 6, 6),
      location: "home",
      frequency: "weekly",
      mood: "happy"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      type: "plant3",
      id: idcounter,
      name: "Prepare dinner",
      completed: "no",
      duedate: DateTime.utc(1944, 6, 6),
      location: "home",
      frequency: "daily",
      mood: "happy"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      type: "plant4",
      id: idcounter,
      name: "Organise notes",
      completed: "no",
      duedate: DateTime.utc(2023, 2, 18),
      location: "home",
      frequency: "weekly",
      mood: "calm"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      id: idcounter,
      type: "plant4",
      name: "Take out the trash",
      completed: "no",
      duedate: DateTime.utc(1944, 6, 6),
      location: "home",
      frequency: "once",
      mood: "calm"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      type: "plant4",
      id: idcounter,
      name: "Get groceries",
      completed: "no",
      duedate: DateTime.utc(1944, 6, 6),
      location: "home",
      frequency: "once",
      mood: "calm"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      id: idcounter,
      type: "plant3",
      name: "Go to John's party",
      completed: "no",
      duedate: DateTime.utc(1944, 6, 6),
      location: "home",
      frequency: "once",
      mood: "excited"));
  idcounter = idcounter + 1;
  tasks.add(Task(
      id: idcounter,
      type: "plant4",
      name: "Write in journal",
      completed: "no",
      duedate: DateTime.utc(1944, 6, 6),
      location: "home",
      frequency: "daily",
      mood: "excited"));
  idcounter = idcounter + 1;
  runApp(const TaskPlanter());
}

var idcounter = 0;
List<Task> tasks = [];

String inputText = "";

/// ΕΔΩ ΠΡΟΣΠΑΘΩ ΝΑ ΦΤΙΑΞΩ ΜΙΑ ΟΘΟΝΗ ΩΣ BACKGTOUND
class Base extends StatelessWidget {
  final myController = TextEditingController();
  //static  Key key2 = "kjkjk";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Task Planter', style: TextStyle(fontSize: 34))),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/cat3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Positioned(
                  right: 0,
                  top: 10, // <-- Change the value here
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: 350,
                    height: 110,
                    color: const Color.fromARGB(255, 255, 184, 133),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              // Do nothing
                            },
                            child: const Text(
                              "Welcome to Task Planter!",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Color.fromARGB(255, 168, 76, 58),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Do nothing
                          },
                          child: const Text(
                            "What's your name?",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color.fromARGB(255, 168, 76, 58),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 168, 76, 58),
                      ),
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 168, 76, 58),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFDCC6),
                      hintText: 'Enter your name',
                      labelText: 'Your Name',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HapticFeedback.heavyImpact();
          inputText = myController.text;
          Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => HomePage(inputText)));
              MaterialPageRoute(builder: (context) => const PageViewDemo()));
          //MaterialPageRoute(                  builder: (context) => MyNavigationBar(key: Key("jjk"))));
        },
        backgroundColor: const Color(0xFFB3F39B),
        child: const Icon(Icons.arrow_forward, color: Color(0xFF2E5627)),
      ),
    );
  }
}

class TaskPlanter extends StatelessWidget {
  const TaskPlanter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Planter',
      theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green)),
      home: Base(),
      //home: MyNavigationBar(key: new Key key),
    );
  }
}
