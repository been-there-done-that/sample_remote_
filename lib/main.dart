// import 'dart:convert';
// import 'package:web_socket_channel/web_socket_channel.dart';

// void main() async {
//   /// Create the WebSocket channel
//   final channel = WebSocketChannel.connect(
//     Uri.parse('wss://ws-feed.pro.coinbase.com'),
//   );

//   channel.sink.add(
//     jsonEncode(
//       {
//         "type": "subscribe",
//         "channels": [
//           {
//             "name": "ticker",
//             "product_ids": [
//               "BTC-EUR",
//             ]
//           }
//         ]
//       },
//     ),
//   );

//   /// Listen for all incoming data
//   channel.stream.listen(
//     (data) {
//       print(data);
//       print(data.runtimeType);
//     },
//   );
// }

import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() async {
  /// Create the WebSocket channel
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://6f81-103-125-163-154.ngrok.io'),
  );

  // channel.sink.add(
  //   jsonEncode(
  //     {
  //       "type": "subscribe",
  //       "channels": [
  //         {
  //           "name": "ticker",
  //           "product_ids": [
  //             "BTC-EUR",
  //           ]
  //         }
  //       ]
  //     },
  //   ),
  // );

  /// Listen for all incoming data
  channel.stream.listen(
    (data) {
      print(data);
      print(data.runtimeType);
    },
  );
}
