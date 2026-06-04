import { useState } from "react";

function BookForm({ onAdd }) {
  const [title, setTitle] = useState("");
  const [author, setAuthor] = useState("");
  const [year, setYear] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!title || !author || !year) {
      alert("Заповни всі поля");
      return;
    }

    onAdd({
      title,
      author,
      year: Number(year),
    });

    setTitle("");
    setAuthor("");
    setYear("");
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        placeholder="Title"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />

      <input
        placeholder="Author"
        value={author}
        onChange={(e) => setAuthor(e.target.value)}
      />

      <input
        placeholder="Year"
        value={year}
        onChange={(e) => setYear(e.target.value)}
      />

      <button type="submit">Add Book</button>
    </form>
  );
}

export default BookForm;