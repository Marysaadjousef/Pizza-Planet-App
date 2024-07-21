import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart_full_model.dart';

class ItemsDatabase {
  static late Future<Database> database;

  static Future<void> createTables() async {
    database = openDatabase(join(await getDatabasesPath(), "items_data.db"),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE Clients (email text PRIMARY KEY,password text NOT NULL, name text not null, image text)");
      await db.execute(
          "CREATE TABLE Item (id integer primary key,name text NOT NULL,description text NOT NULL, category text NOT NULL,image text NOT NULL)");
      await db.execute(
          "CREATE TABLE ItemSizes (id integer primary key,item_id integer,size text, price DECIMAL NOT NULL, quantity integer not null,FOREIGN KEY (item_id) REFERENCES Item(id))");
      await db.execute(
          "CREATE TABLE Orders( id INT PRIMARY KEY,client_email text,order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY (client_email) REFERENCES Clients(email))");
      await db.execute(
          "CREATE TABLE orderItems (id INT PRIMARY KEY,order_id INT,item_size_id INT,quantity INT NOT NULL,FOREIGN KEY (order_id) REFERENCES Orders(id),FOREIGN KEY (item_size_id) REFERENCES ItemSizes(id))");
    }, onUpgrade: (db, version, l) async {
      await db.execute("drop table clients");
      await db.execute("drop table item");
      await db.execute("drop table ItemSizes");
      await db.execute("drop table Orders");
      await db.execute("drop table orderItems");

      await db.execute(
          "CREATE TABLE Clients (email text PRIMARY KEY,password text NOT NULL, name text not null, image text)");
      await db.execute(
          "CREATE TABLE Item (id integer primary key,name text NOT NULL,description text NOT NULL, category text NOT NULL,image text NOT NULL)");
      await db.execute(
          "CREATE TABLE ItemSizes (id integer primary key,item_id integer,size text, price DECIMAL NOT NULL, quantity integer not null,FOREIGN KEY (item_id) REFERENCES Item(id))");
      await db.execute(
          "CREATE TABLE Orders( id INT PRIMARY KEY,client_email text,order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY (client_email) REFERENCES Clients(email))");
      await db.execute(
          "CREATE TABLE orderItems (id INT PRIMARY KEY,order_id INT,item_size_id INT,quantity INT NOT NULL,FOREIGN KEY (order_id) REFERENCES Orders(id),FOREIGN KEY (item_size_id) REFERENCES ItemSizes(id))");
    }, version: 21);
  }

  static Future<List<Map<String, dynamic>>> getTableData(
      String tableName) async {
    Database db = await database;
    return await db.rawQuery("select * from $tableName");
  }

  static Future<List<Map<String, dynamic>>> getDataWhere(
      String tableName, String columnName, List<dynamic> value) async {
    Database db = await database;
    return db.query(tableName, where: '$columnName = ?', whereArgs: value);
  }

  static Future<int> insertData(
      String tableName, Map<String, dynamic> map) async {
    Database db = await database;
    return await db.insert(tableName, map);
  }

  static Future<int> updateData(
      String tableName, Map<String, dynamic> map) async {
    Database db = await database;
    return await db.rawUpdate(
        "update $tableName set count = ${map["count"]} where id = ${map["id"]} and email = '${map["email"]}'");
  }

  static Future<int> updateQuantity(
      int extraQuantity, int itemSizeId, int orderId) async {
    Database db = await database;
    int newQuantity;
    List<Map<String, dynamic>> quantity = await db.rawQuery(
        "select quantity from orderItems where order_id = $orderId and item_size_id = $itemSizeId");
    newQuantity = quantity[0]['quantity'];

    return await db.rawUpdate(
        "update orderItems set quantity = ${newQuantity + extraQuantity} where order_id = $orderId and item_size_id = $itemSizeId");
  }

  static Future<int> deleteTable(String tableName) async {
    Database db = await database;
    return await db.delete(tableName);
  }

  static Future<void> deleteFromCart(PizzaCardFullData itemCardFullData) async {
    Database db = await database;
    List<Map<String, dynamic>> oldQuantity = await db.rawQuery(
        "select quantity from ItemSizes where item_id = ${itemCardFullData.id} and size = '${itemCardFullData.size}'");
    await db.rawUpdate(
        "update ItemSizes set quantity = ${oldQuantity[0]['quantity'] + itemCardFullData.quantity}");
    await db.rawQuery(
        "delete from orderItems where order_id = ${itemCardFullData.orderId} and item_size_id = ${itemCardFullData.pizzaSizeId}");
    List<Map<String, dynamic>> orders = await db.rawQuery(
        "select quantity from orderItems where order_id = ${itemCardFullData.orderId}");
    if (orders.isEmpty || orders[0]['quantity'] == null) {
      await db.rawQuery(
          "delete from Orders where id = ${itemCardFullData.orderId}");
    }
  }

  static Future<int> getNewId(String tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> l =
        await db.rawQuery("SELECT MAX(id) FROM $tableName");
    if (l[0]["MAX(id)"] != null) {
      return l[0]["MAX(id)"] + 1 ?? 1;
    } else {
      return 1;
    }
  }
}
