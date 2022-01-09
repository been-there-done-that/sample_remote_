import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

WebSocketConnection(String url) {
  /// Create the WebSocket channel
  String finalUrl = 'wss://' + url;
  print(finalUrl);
  final channel = WebSocketChannel.connect(
    // final_url = 'wss://' + url;
    Uri.parse(finalUrl),
  );

  // return channel.stream;
  print(channel);
  channel.stream.listen(
    (dynamic message) {
      print('message $message');
    },
    onDone: () {
      print('ws channel closed');
      channel.sink.close(status.goingAway);
    },
    onError: (error) {
      print('ws error $error');
      channel.sink.close(status.goingAway);
    },
  );
}
