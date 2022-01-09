import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

String? global;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _message;
  late WebSocketChannel channel;
  var sub;
  late String text;

  @override
  void initState() {
    super.initState();
    FlutterLocalNotificationsPlugin notifications =
        FlutterLocalNotificationsPlugin();
    var androidInit =
        const AndroidInitializationSettings('ic_android_black_24dp');
    var iOSInit = const IOSInitializationSettings();
    channel = WebSocketChannel.connect(
        Uri.parse('ws://f779-103-125-163-154.ngrok.io'));
    _message = TextEditingController();
    var init = InitializationSettings(android: androidInit, iOS: iOSInit);
    notifications.initialize(init).then(
      (done) {
        sub = channel.stream.listen(
          (newData) {
            text = newData;
            global = newData;
            print(newData);
            notifications.show(
              0,
              "New announcement",
              text,
              const NotificationDetails(
                android: AndroidNotificationDetails(
                  "announcement_app_0",
                  "Announcement App",
                ),
                iOS: IOSNotificationDetails(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _message.dispose();
    channel.sink.close(status.goingAway);
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Text(global ?? "Default Null Value"),
        // child: Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       TextField(
        //         controller: _message,
        //         autofocus: false,
        //         decoration: InputDecoration(
        //           hintText: 'Type your Message',
        //           errorText: _iserror ? 'Textfield is empty!' : null,
        //           contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //           border: OutlineInputBorder(),
        //         ),
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.send),
        //         onPressed: () {
        //           setState(() {
        //             _message.text.isEmpty ? _iserror = true : _iserror = false;
        //           });
        //           if (!_iserror) {
        //             channel.sink.add(jsonEncode({'message': _message.text}));
        //             _message.text = '';
        //           }
        //         },
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
