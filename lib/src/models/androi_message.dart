import 'package:local_auth/auth_strings.dart';

class AndroidMessage extends AndroidAuthMessages {
  late AndroidAuthMessages message;
  late String help;
  AndroidMessage({
    required String title,
    required String help,
    String subtitle: "",
  }) {
    this.message = AndroidAuthMessages(
      biometricHint: subtitle,
      signInTitle: title,
    );

    this.help = help;
  }
}
