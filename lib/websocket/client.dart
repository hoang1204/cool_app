import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

void socket() {
  final wsUrl = Uri.parse('ws://192.168.1.59:3000');

  var channel = WebSocketChannel.connect(wsUrl);

  channel.stream.listen((message) {
    channel.sink.add('received!');
    channel.sink.close(status.goingAway);
  });
}
