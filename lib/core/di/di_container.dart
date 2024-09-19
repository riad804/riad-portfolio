import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio_client/core/di/di_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi() async {
  getIt.init();
  return getIt.allReady();
}
