import { useState } from 'react';
import './App.css';

function App() {
  const [data, setData] = useState(null);

  const fetchData = async () => {
    try {
      const res = await fetch('/api/');
      const json = await res.json();
      setData(json);
    } catch (error) {
      setData({ error: 'Failed to fetch API' });
    }
  };

  return (
    <div className="app-container">
      <h1>Test Backend API</h1>
      <button onClick={fetchData}>Fetch API Data</button>
      <pre>{data ? JSON.stringify(data, null, 2) : 'No data yet.'}</pre>
    </div>
  );
}

export default App;
