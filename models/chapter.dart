import 'package:flutter/foundation.dart' show required;

class Chapter {
  Chapter({@required this.title, @required this.offset, @required this.length});

  final String title;
  final int offset;
  final int length;

  Chapter.fromJson(Map value)
      : title = value['title'] as String,
        offset = value['offset'] as int,
        length = value['length'] as int;
}

class CustomEbookChapter extends Object{
  int id;
  String lastModified, title, href;
  int ebook_id, parent_id, subchapter_id, subsubchapter_id;

CustomEbookChapter({this.id,this.lastModified, this.title, this.href,this.ebook_id, this.parent_id, this.subchapter_id, this.subsubchapter_id});
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
