import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class AppService{
  AppService() {
    print("AppService singleton instance is being created.");
  }
  // Step 1
  /*String execute() async {
    print("Service executed");
  }*/

  String execute() {
    DateTime now = DateTime.now();
    DateTime date =  DateTime(now.year, now.month, now.day);
    return date.toString();
  }
}

void setup() {
  print("registerSingleton is being called");
  // Singleton
  getIt.registerSingleton<AppService>(AppService());

  // LazySingleton
  //getIt.registerLazySingleton<AppService>(() => AppService());

  // LazySingleton
  //getIt.registerFactory<AppService>(() => AppService());
}