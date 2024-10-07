import '/components/task.dart';
import '/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    // print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      // print('a Tarefa não Existia.');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      // print('a Tarefa existia!');
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  // Task -> Map
  Map<String, dynamic> toMap(Task tarefa) {
    // print('Convertendo to Map: ');
    final Map<String, dynamic> mapaDeTarefas = {};
    // final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    // print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  // procurar todas as tarefas
  Future<List<Task>> findAll() async {
    // print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    // print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  // Map -> Task
  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    // print('Convertendo to List:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
      );
      tarefas.add(tarefa);
    }
    // print('Lista de Tarefas: ${tarefas.toString()}');
    return tarefas;
  }

  // buscar apenas uma tarefa específica
  Future<List<Task>> find(String nomeDaTarefa) async {
    // print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    // print('Procurando tarefa com o nome: ${nomeDaTarefa}');
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    // print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  // deleta uma tarefa
  delete(String nomeDaTarefa) async {
    // print('Deletando tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
