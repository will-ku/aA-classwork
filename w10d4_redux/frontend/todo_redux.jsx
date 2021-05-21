import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Redux from 'redux';
import {receiveTodo, receiveTodos} from './actions/todo_actions'
import Root from './components/root'
import {allTodos} from './reducers/selectors'

// const object = { id: 3, title: "New Todo" }
// store.dispatch(receiveTodo(object)) 
// store.dispatch(receiveTodos(object)) 


document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore()
  window.store = store
  window.allTodos = allTodos
  ReactDOM.render(<h1>Not Todos App</h1>, document.getElementById("content"))
  window.receiveTodos = receiveTodos
  window.receiveTodo = receiveTodo
})

  // < Root store = { store } />