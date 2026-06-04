function BookItem({ book, onDelete }) {
  return (
    <div style={{ border: "1px solid #ccc", margin: 10, padding: 10 }}>
      <h3>{book.title}</h3>
      <p>Author: {book.author}</p>
      <p>Year: {book.year}</p>

      <button onClick={() => onDelete(book.id)}>
        Delete
      </button>
    </div>
  );
}

export default BookItem;