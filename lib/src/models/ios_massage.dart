import 'package:local_auth/auth_strings.dart';

class IOSMessage extends IOSAuthMessages {
  late IOSAuthMessages message;
  late String help;

  IOSMessage({String? help}) {
    this.message = IOSAuthMessages();
    this.help = help ?? "No message";
  }
}
