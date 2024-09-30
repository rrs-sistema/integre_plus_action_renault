import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database_imports.dart';

part 'supervisores_dao.g.dart';

@DriftAccessor(tables: [
  Supervisoress,
])
class SupervisoresDao extends DatabaseAccessor<AppDatabase> with _$SupervisoresDaoMixin {
  final AppDatabase db;

  List<Supervisores> supervisoresList = [];
  List<SupervisoresGrouped> supervisoresGroupedList = [];

  SupervisoresDao(this.db) : super(db);

  Future<List<Supervisores>> getList() async {
    supervisoresList = await select(supervisoress).get();
    return supervisoresList;
  }

  Future<List<Supervisores>> getListFilter(String field, String value) async {
    final query = " $field like '%$value%'";
    final expression = CustomExpression<bool>(query);
    supervisoresList = await (select(supervisoress)..where((t) => expression)).get();
    return supervisoresList;
  }

  Future<List<SupervisoresGrouped>> getGroupedList({String? field, dynamic value}) async {
    final query = select(supervisoress).join([]);

    if (field != null && field != '') {
      final column = supervisoress.$columns.where(((column) => column.$name == field)).first;
      if (column is TextColumn) {
        query.where((column as TextColumn).like('%$value%'));
      } else if (column is IntColumn) {
        query.where(column.equals(int.tryParse(value) as Object));
      } else if (column is RealColumn) {
        query.where(column.equals(double.tryParse(value) as Object));
      }
    }

    supervisoresGroupedList = await query.map((row) {
      final supervisores = row.readTableOrNull(supervisoress);

      return SupervisoresGrouped(
        supervisores: supervisores,
      );
    }).get();

    // fill internal lists
    //dynamic expression;
    //for (var supervisoresGrouped in supervisoresGroupedList) {
    //}

    return supervisoresGroupedList;
  }

  Future<Supervisores?> getObject(dynamic pk) async {
    return await (select(supervisoress)..where((t) => t.supervisorid.equals(pk))).getSingleOrNull();
  }

  Future<Supervisores?> getObjectFilter(String field, String value) async {
    final query = "SELECT * FROM supervisores WHERE $field like '%$value%'";
    return (await customSelect(query).getSingleOrNull()) as Supervisores;
  }

  Future<SupervisoresGrouped?> getObjectGrouped({String? field, dynamic value}) async {
    final result = await getGroupedList(field: field, value: value);

    if (result.length != 1) {
      return null;
    } else {
      return result[0];
    }
  }

  Future<int> insertObject(SupervisoresGrouped object) {
    return transaction(() async {
      final maxPk = await lastPk();
      object.supervisores = object.supervisores!.copyWith(supervisorid: Value(maxPk + 1));
      final pkInserted = await into(supervisoress).insert(object.supervisores!);
      object.supervisores = object.supervisores!.copyWith(supervisorid: Value(pkInserted));
      await insertChildren(object);
      return pkInserted;
    });
  }

  Future<bool> updateObject(SupervisoresGrouped object) {
    return transaction(() async {
      await deleteChildren(object);
      await insertChildren(object);
      return update(supervisoress).replace(object.supervisores!);
    });
  }

  Future<int> deleteObject(SupervisoresGrouped object) {
    return transaction(() async {
      await deleteChildren(object);
      return delete(supervisoress).delete(object.supervisores!);
    });
  }

  Future<void> insertChildren(SupervisoresGrouped object) async {}

  Future<void> deleteChildren(SupervisoresGrouped object) async {}

  Future<int> lastPk() async {
    final result =
        await customSelect("select MAX(supervisorid) as LAST from supervisores").getSingleOrNull();
    return result?.data["LAST"] ?? 0;
  }
}
