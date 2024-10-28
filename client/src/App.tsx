import { useState } from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import './App.css';
import Home from './pages/Home';
import Navbar from './components/Navbar';

function App() {
  const [count, setCount] = useState(0);

  return (
    <Router>
      <div>
        <Navbar />
        <Routes>
          <Route path="/" element={<div>Main Page</div>} />
          <Route path="/home" element={<Home />} />
        </Routes>


      </div>
    </Router>
  );
}

export default App;