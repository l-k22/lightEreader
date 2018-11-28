import 'dart:io';
import 'package:flutter/foundation.dart' show required;
import '../utils/utils.dart';

class Book {
  Book({
    this.title,
    this.book_id,
    this.description,
    this.coverUri,
    this.uri,
    this.type,
    this.createAt,
    this.updateAt,
  });

  Book.fromFile(FileSystemEntity file)
      : assert(file != null),
        book_id = null,
        // assert(!FileSystemEntity.isDirectorySync(file.path)),
        title = getFileBaseName(file),
        description = null,
        coverUri = null,
        uri = file.path,
        type = getFileType(file),
        updateAt = new DateTime.now().toIso8601String(),
        createAt = new DateTime.now().toIso8601String();

  Book.fromMap(Map<String, dynamic> map)
      : assert(null != map),
        title = map['title'],
        book_id = map['book_id'],
        description = map['description'],
        coverUri = map['cover_uri'],
        uri = map['uri'],
        type = map['type'],
        createAt = map['create_at'],
        updateAt = map['update_at'];
  // : assert(value != null),
  //   assert(value.isNotEmpty),
  //   title = value['title'],
  //   coverUri = value['coverUri'],
  //   uri = value['uri'],
  //   type = getColumn('type', value),
  //   updateAt = value['updateAt'],
  //   createAt = value['createAt'];

  int book_id;
  final String title;
  final String coverUri;
  final String uri;
  final FileType type;
  final String updateAt;
  final String createAt;
  final String description;

  static getColumn(String key, [Map<String, dynamic> json]) {
    switch (key) {
      case 'type':
        return FileType.values.firstWhere((v) => v.toString() == json[key]);
      default:
        return null;
    }
  }

  @override
  String toString() => '{title: $title, type: $type, uri: $uri}\n';

  Map<String, dynamic> getMap() {
    return {
      'title': title,
      'book_id': book_id,
      'description': description,
      'cover_uri': coverUri,
      'uri': uri,
      'type': type.toString(),
      // 'update_at': update_at,
      'create_at': createAt
    };
  }

  String get typeString {
    return new RegExp(r'\.([a-z]+)$', caseSensitive: false)
        .firstMatch(type.toString())
        ?.group(1);
  }

  operator ==(dynamic value) {
    if (null == value || value is! Book) return false;
    return value.uri == this.uri;
  }
}

class CustomEbookChapter extends Object {
  int id;
  String lastModified, title, href;
  int ebook_id, parent_id, subchapter_id, subsubchapter_id;

  CustomEbookChapter(
      {this.id,
      this.lastModified,
      this.title,
      this.href,
      this.ebook_id,
      this.parent_id,
      this.subchapter_id,
      this.subsubchapter_id});
  CustomEbookChapter.fromMap(Map map) {
    try {
      id = map['id'] as int;
      lastModified = map[''] as String;
      ebook_id = map['ebook_id'] as int;
      parent_id = map['parent_id'] as int;
      subchapter_id = map['subchapter_id'] as int;
      subsubchapter_id = map['subsubchapter_id'] as int;
      title = map['section'] as String;
      href = map['href'] as String;
    } catch (e) {
      print('ERROR unable to create EbookChap object');
    }
  }
}
