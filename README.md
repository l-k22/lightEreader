# lightEreader

Book book;

Future<Book> getBook(String moduleName) async {
  Book book;

  try {
    final docDirectory = (await getApplicationDocumentsDirectory()).path;
    final ebook_dir = new Directory('$docDirectory/ebook/$ebookName').path;
    File file = new File('$ebook_dir/$ebookName.epub');
    book = new Book.fromFile(file);
  } catch (e) {
    print('$e');
  }
  return book;
}

Navigator.push(context,
   new MaterialPageRoute(
     builder: (BuildContext context) {
       return new Reader(book: book);
      }));
