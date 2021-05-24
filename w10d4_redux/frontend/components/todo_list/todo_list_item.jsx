import React from 'React'

const TodoListItem = (props) => {
  return (
    <li>{props.todo.title}, {props.todo.body}</li>
  )}

export default TodoListItem