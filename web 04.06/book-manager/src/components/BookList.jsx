import BookItem from "./BookItem";

function BookList({ books, onDelete }) {
  return (
    <div>
      {books.map((book) => (
        <BookItem
          key={book.id}
          book={book}
          onDelete={onDelete}
        />
      ))}
    </div>
  );
}

export default BookList;