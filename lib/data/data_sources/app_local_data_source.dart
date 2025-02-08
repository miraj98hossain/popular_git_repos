import 'package:popular_git_repos/data/models/repositories_response.dart';
import 'package:sqflite/sqflite.dart';

abstract class AppLocalDataSource {
  Future<void> insertOrUpdateOwner(Owner owner);

  Future<void> insertOrUpdateLicense(License license);
  Future<List<Repository>> getRepositories({int limit = 10, int offset = 0});
  Future<void> insertOrUpdateRepository(Repository repository);
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final Database _database;

  AppLocalDataSourceImpl({required Database database}) : _database = database;
  @override
  Future<void> insertOrUpdateOwner(Owner owner) async {
    final db = _database;
    await db.insert(
      'owners',
      owner.toTabMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> insertOrUpdateLicense(License license) async {
    final db = _database;
    await db.insert(
      'licenses',
      license.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> insertOrUpdateRepository(Repository repository) async {
    final db = _database;

    // Insert or update Owner
    await insertOrUpdateOwner(repository.owner!);

    // Insert or update License (if exists)
    if (repository.license != null) {
      await insertOrUpdateLicense(repository.license!);
    }

    // Insert or update Repository
    await db.insert(
      'repositories',
      repository.toTabMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Repository>> getRepositories(
      {int limit = 10, int offset = 0}) async {
    final db = _database;

    // Query repositories with pagination
    final List<Map<String, dynamic>> repositoryMaps = await db.query(
      'repositories',
      limit: limit,
      offset: offset,
    );

    // Fetch related owners and licenses for each repository
    final List<Repository> repositories = [];
    for (var repoMap in repositoryMaps) {
      // Fetch owner
      final ownerId = repoMap['owner_id'];
      final List<Map<String, dynamic>> ownerMaps = await db.query(
        'owners',
        where: 'id = ?',
        whereArgs: [ownerId],
      );
      final Owner owner = Owner.fromTabMap(ownerMaps.first);

      // Fetch license (if exists)
      final licenseNodeId = repoMap['license_node_id'];
      final List<Map<String, dynamic>> licenseMaps = await db.query(
        'licenses',
        where: 'node_id = ?',
        whereArgs: [licenseNodeId],
      );
      License license = License.fromMap(licenseMaps.first);

      // Create Repository object
      final repository = Repository.fromTabMap(repoMap);

      repositories.add(repository);
    }

    return repositories;
  }
}
