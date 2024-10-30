import React from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css';

const Navbar: React.FC = () => {
    return (
        <nav className="navbar">
          <div className="navbar-title">BREATHINK</div>
            <input type="text" name="text" placeholder="É por mim que procuras?" className="input"></input>
          <div className="navbar-links">
            <Link to="/">Início</Link>
            <Link to="/about">About</Link>
          </div>
          <div className="navbar-user">
            <img
              src="https://via.placeholder.com/40"
              alt="User"
              className="user-image"
            />
          </div>
        </nav>
      );
};

export default Navbar;
