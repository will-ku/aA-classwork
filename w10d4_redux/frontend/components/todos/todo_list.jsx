import React from 'React'
import TodoListItem from '../todo_list/todo_list_item'
import TodoForm from '../todo_list/todo_form'


const TodoList = (props) => (
  <div>
    <h3>Todo List goes here!</h3>
      {console.log(props)}
    <ul>
      {props.todos.map((todo, idx) => <TodoListItem key={idx} todo={todo} />)}
    </ul>

    <div>
      <TodoForm receiveTodo={props.receiveTodo} />
    </div>
  
  </div>
  )

export default TodoList;