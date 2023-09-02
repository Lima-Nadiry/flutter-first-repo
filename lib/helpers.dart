import 'dart:math';
import 'package:intl/intl.dart';

abstract class Helpers {
  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  static String randomDate() {
    final random = Random();
    final currentDate = DateTime.now();
    //return currentDate.subtract(Duration(seconds: random.nextInt(200000)));
    DateTime time =
        currentDate.subtract(Duration(seconds: random.nextInt(200000)));
    if (time.difference(currentDate).abs().inDays < 1) {
      return DateFormat.jm().format(time); // Format time only
    } else {
      return DateFormat('yyy-MM-dd').format(time); // Format date and time
    }
  }
}
