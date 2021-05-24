import React from 'React'
import TodoListItem from '../todo_list/todo_list_item'

const TodoList = (props) => (
  <div>
    <h3>Todo List goes here!</h3>
      {console.log(props)}
    <ul>
      {props.todos.map((todo, idx) => <TodoListItem key={idx} todo={todo} />)}
    </ul>
  
  </div>
  )

export default TodoList;