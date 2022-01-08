import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketConnection(String url) {
  /// Create the WebSocket channel
  String finalUrl = 'wss://' + url;
  print(finalUrl);
  final channel = WebSocketChannel.connect(
    // final_url = 'wss://' + url;
    Uri.parse(finalUrl),
  );

  channel.stream.listen(
    (dynamic message) {
      print('message $message');
    },
    onDone: () {
      print('ws channel closed');
    },
    onError: (error) {
      print('ws error $error');
    },
  );
}
