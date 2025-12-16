import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      ),
      level: Level.debug);

  static Logger get instance => _logger;
}
