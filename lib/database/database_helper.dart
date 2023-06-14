import 'package:cubit_task/modal/form_modal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;

  static Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDataBase();
      return _database;
    }
  }

  static Future<Database> initDataBase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Form.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE FormData (id INTEGER PRIMARY KEY AUTOINCREMENT,firstName TEXT,lastName TEXT,gender Text,city Text,hobbies Text)");
      },
    );
    return database;
  }

  static Future<int> insertData(FormModal formModal) async {
    print(formModal.toMap());
    int cnt = await DbHelper._database!.insert("FormData", formModal.toMap());
    return cnt;
  }

  static Future<List<FormModal>> viewAllData() async {
    List<Map<String, Object?>> listOfFormModal = await DbHelper._database!.query("FormData");
    return listOfFormModal.map((e) => FormModal.fromMap(e)).toList();
  }

  static Future<List<FormModal>> selectData(int id) async {
    List<Map<String, Object?>> listOfFormModal = await DbHelper._database!.query("FormData", where: 'id = ?', whereArgs: [id]);
    return listOfFormModal.map((e) => FormModal.fromMap(e)).toList();
  }

  static Future<void> updateData(FormModal formModal) async {
    print(formModal.toMap());
    await DbHelper._database!.update("FormData", formModal.toMap(),where: 'id = ?',whereArgs: [formModal.id],);
  }
}
