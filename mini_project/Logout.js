
import React from 'react';

import { useNavigate } from 'react-router-dom';

export const Logout = () => {
  const navigate = useNavigate();

  const handleLogout = () => {
    
    navigate('/login');
  };

  return (
    <center>
      <div >
      <h4 className='mx-2'>Are you sure you want to log out?</h4>
      <button onClick={handleLogout} className='btn btn-outline-danger mx-2 mt-2'>Logout</button>
    </div>
    </center>
  );
};

