import 'package:karasu/services/config_service.dart';
import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    // Use DevelopmentFilter in debug mode, ProductionFilter otherwise
    filter: ConfigService().isDebugMode
        ? DevelopmentFilter()
        : ProductionFilter(),
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    level: Level.debug,
  );

  static Logger get instance => _logger;
}
