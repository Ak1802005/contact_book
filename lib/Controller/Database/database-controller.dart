import 'package:firstforapp/Model/addCredential.dart';
import 'package:firstforapp/Model/credential.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseController {
  DatabaseController._();

  static Database? _database;

  static Future<DatabaseController> createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, username TEXT, password TEXT)');
      await db.execute(
          'CREATE TABLE addcontacts (id INTEGER PRIMARY KEY AUTOINCREMENT, userId INTEGER, firstName TEXT, lastName TEXT, number TEXT, email TEXT, relation TEXT, work TEXT, address TEXT, link TEXT)');
    });
    return DatabaseController._();
  }

  Future<void> registerUser(Credential credential) async {
    String sql =
        "INSERT INTO users (`name`, `email`, `username`, `password`) VALUES('${credential.name}', '${credential.email}', '${credential.username}', '${credential.password}')";
    await _database!.execute(sql);
  }

  Future<Credential?> login(
      {required String username, required String password}) async {
    String sql =
        "SELECT * FROM users WHERE `username`= '$username' AND `password`= '$password'";
    List<Map<String, Object?>> data = await _database!.rawQuery(sql);
    if (data.isNotEmpty) {
      return Credential.fromJson(data[0]);
    }
  }

  Future<void> addContact(
      {required AddCredetial addCredetial, required int? userId}) async {
    String sql =
        "INSERT INTO addcontacts (`userId`, `firstName`, `lastName`, `number`, `email`, `relation`, `work`, `address`, `link`) VALUES('${userId}','${addCredetial.firstName}', '${addCredetial.lastName}','${addCredetial.number}', '${addCredetial.email}','${addCredetial.relation}', '${addCredetial.work}','${addCredetial.address}', '${addCredetial.link}')";
    await _database!.execute(sql);
  }

  Future<List<AddCredetial>> viewContacts(int userid) async {
    String sql = "SELECT * FROM addcontacts WHERE `userId` = $userid";
    List<Map> contacts = await _database!.rawQuery(sql);
    if (contacts.isNotEmpty) {
      return contacts.map((e) => AddCredetial.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<int> updateContacts(
      AddCredetial addCredetial) {
    String sql =
        "UPDATE addcontacts SET `firstName` = '${addCredetial.firstName}', `lastName` = '${addCredetial.lastName}', `number` = '${addCredetial.number}', `email` = '${addCredetial.email}', `work` = '${addCredetial.work}', `relation` = '${addCredetial.relation}', `address` = '${addCredetial.address}', `link` = '${addCredetial.link}' WHERE `id` = '${addCredetial.id}'";
    return _database!.rawUpdate(sql);
  }

  Future<void> deleteContacts(int id) {
    String sql = "DELETE FROM addcontacts WHERE id = '$id'";
    return _database!.execute(sql);

  }
}
