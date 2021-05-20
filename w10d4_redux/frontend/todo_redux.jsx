import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Redux from 'redux';

document.addEventListener("DOMContentLoaded", () => {
  const header = <h1>Todos App</h1>
  ReactDOM.render(header, document.getElementById("content"))
  const store = configureStore()
  window.store = store
})