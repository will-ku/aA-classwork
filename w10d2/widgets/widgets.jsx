import React from 'react';
import ReactDOM from 'react-dom';
import App from './frontend/app';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  console.log(root)
  ReactDOM.render(<App/>, root);
});
