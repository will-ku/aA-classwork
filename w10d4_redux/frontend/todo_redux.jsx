import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Redux from 'redux';
import {receiveTodo, receiveTodos} from './actions/todo_actions'

const store = configureStore()
window.store = store
const object = { id: 3, title: "New Todo" }
store.dispatch(receiveTodo(object)) 
store.dispatch(receiveTodos(object)) 


document.addEventListener("DOMContentLoaded", () => {
  const header = <h1>Todos App</h1>
  ReactDOM.render(header, document.getElementById("content"))

})