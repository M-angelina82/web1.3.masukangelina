import { useEffect, useState } from "react";
import Header from "./components/Header";
import Footer from "./components/Footer";
import BookForm from "./components/BookForm";
import BookList from "./components/BookList";

function App() {
  const [books, setBooks] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const API = "http://localhost:3001/books";

  // GET
  const fetchBooks = async () => {
    setLoading(true);
    try {
      const res = await fetch(API);
      const data = await res.json();
      setBooks(data);
      setError("");
    } catch {
      setError("Помилка завантаження");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchBooks();
  }, []);

  // POST
  const addBook = async (book) => {
    await fetch(API, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(book)
    });

    fetchBooks();
  };

  // DELETE
  const deleteBook = async (id) => {
    await fetch(`${API}/${id}`, {
      method: "DELETE"
    });

    fetchBooks();
  };

  return (
    <div>
      <Header />

      <BookForm onAdd={addBook} />

      {loading && <p>Loading...</p>}
      {error && <p>{error}</p>}

      <BookList books={books} onDelete={deleteBook} />

      <Footer />
    </div>
  );
}

export default App;