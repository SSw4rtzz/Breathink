import { useState } from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import reactLogo from './assets/react.svg';
import viteLogo from '/vite.svg';
import './App.css';
import Home from './pages/Home';

function App() {
  const [count, setCount] = useState(0);

  return (
    <Router>
      <div>
        
        <Routes>
          <Route path="/" element={<div>Main Page</div>} />
          <Route path="/home" element={<Home />} />
        </Routes>

        <nav>
          <Link to="/">Home</Link>
          <Link to="/home">Home Page</Link>
        </nav>
      </div>
    </Router>
  );
}

export default App;