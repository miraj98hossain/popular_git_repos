import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._constructor();
  LocalDatabase._constructor();

  static const _dbName = 'podularGitRepo.db';
  static const _dbVersion = 1;

  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String directory = await getDatabasesPath();
    String path = join(directory, _dbName);
    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE repositories (
        id INTEGER PRIMARY KEY,
        node_id TEXT,
        name TEXT,
        full_name TEXT,
        private INTEGER,
        owner_id INTEGER,
        html_url TEXT,
        description TEXT,
        fork INTEGER,
        url TEXT,
        forks_url TEXT,
        keys_url TEXT,
        collaborators_url TEXT,
        teams_url TEXT,
        hooks_url TEXT,
        issue_events_url TEXT,
        events_url TEXT,
        assignees_url TEXT,
        branches_url TEXT,
        tags_url TEXT,
        blobs_url TEXT,
        git_tags_url TEXT,
        git_refs_url TEXT,
        trees_url TEXT,
        statuses_url TEXT,
        languages_url TEXT,
        stargazers_url TEXT,
        contributors_url TEXT,
        subscribers_url TEXT,
        subscription_url TEXT,
        commits_url TEXT,
        git_commits_url TEXT,
        comments_url TEXT,
        issue_comment_url TEXT,
        contents_url TEXT,
        compare_url TEXT,
        merges_url TEXT,
        archive_url TEXT,
        downloads_url TEXT,
        issues_url TEXT,
        pulls_url TEXT,
        milestones_url TEXT,
        notifications_url TEXT,
        labels_url TEXT,
        releases_url TEXT,
        deployments_url TEXT,
        created_at TEXT,
        updated_at TEXT,
        pushed_at TEXT,
        git_url TEXT,
        ssh_url TEXT,
        clone_url TEXT,
        svn_url TEXT,
        homepage TEXT,
        size INTEGER,
        stargazers_count INTEGER,
        watchers_count INTEGER,
        language TEXT,
        has_issues INTEGER,
        has_projects INTEGER,
        has_downloads INTEGER,
        has_wiki INTEGER,
        has_pages INTEGER,
        has_discussions INTEGER,
        forks_count INTEGER,
        mirror_url TEXT,
        archived INTEGER,
        disabled INTEGER,
        open_issues_count INTEGER,
        license_node_id TEXT,
        allow_forking INTEGER,
        is_template INTEGER,
        web_commit_signoff_required INTEGER,
        topics TEXT,
        visibility TEXT,
        forks INTEGER,
        open_issues INTEGER,
        watchers INTEGER,
        default_branch TEXT,
        score REAL,
        FOREIGN KEY (owner_id) REFERENCES owners(id),
        FOREIGN KEY (license_node_id) REFERENCES licenses(node_id)
      )
    ''');

        await db.execute('''
      CREATE TABLE owners (
        id INTEGER PRIMARY KEY,
        login TEXT,
        node_id TEXT,
        avatar_url TEXT,
        gravatar_id TEXT,
        url TEXT,
        html_url TEXT,
        followers_url TEXT,
        following_url TEXT,
        gists_url TEXT,
        starred_url TEXT,
        subscriptions_url TEXT,
        organizations_url TEXT,
        repos_url TEXT,
        events_url TEXT,
        received_events_url TEXT,
        type TEXT,
        user_view_type TEXT,
        site_admin INTEGER
      )
    ''');

        await db.execute('''
      CREATE TABLE licenses (
        node_id TEXT PRIMARY KEY,
        key TEXT,
        name TEXT,
        spdx_id TEXT,
        url TEXT
      )
    ''');
      },
      onConfigure: (db) {},
    );
  }
}
