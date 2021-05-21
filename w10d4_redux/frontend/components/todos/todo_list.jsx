import React from 'React'

const TodoList = (props) => (
  <div>
    <h3>Todo List goes here!</h3>
      {console.log(props)}
    <ul>
      {props.todos.map((todo, idx) => <li key={idx}>{todo.title}, {todo.body}</li>)}
    </ul>
  
  </div>
  )

export default TodoList;