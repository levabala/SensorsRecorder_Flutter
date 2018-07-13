import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get appDirPath async =>
    (await getApplicationDocumentsDirectory()).path;

Future<File> getLocalFile(String filename) async =>
    File("${await appDirPath}/$filename");

Future<File> writeToFile(File file, String content) async =>
    file.writeAsString(content);

Future<File> writeByPath(String path, String content) async =>
    (await getLocalFile(path)).writeAsString(content);
