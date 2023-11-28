// ignore_for_file: file_names

class DataSingleton {
  static final DataSingleton _instance = DataSingleton._internal();

  factory DataSingleton() {
    return _instance;
  }

  DataSingleton._internal();

  String dataTitle = '';
  String dataDesc = '';
}
