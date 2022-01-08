import 'dart:convert';
import 'package:sample_remote_/socket_helper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

String url = '6f81-103-125-163-154.ngrok.io';

void main() async {
  final stream = WebSocketConnection(url);

  /// Listen for all incoming data
  // stream.listen(
  //   (data) {
  //     print(data);
  //     print(data.runtimeType);
  //   },
  // );
}
