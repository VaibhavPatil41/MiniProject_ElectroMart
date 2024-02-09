
import React from 'react';

import { useNavigate } from 'react-router-dom';

export const Cust_page = () => {
  const navigate = useNavigate();

  const handleLogout = () => {
    
    navigate('/CustomerPage');
  };

  return (
    <div>
      <p>Are you sure you want to log out?</p>
      <button onClick={handleLogout}>Logout</button>
    </div>
  );
};

