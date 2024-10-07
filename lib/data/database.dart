import '/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path =
      join(await getDatabasesPath(), 'task.db'); // buscar o melhor caminho
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  ); // acesse o 'path' e crie o banco de dados (se não existir, executando a 'tableSql')
}
// Database: tipo vindo do sqflite
// task.db: nome do banco de dados
// 'tableSql': corpo do banco de dados