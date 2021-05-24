import {RECEIVE_TODO, RECEIVE_TODOS} from "../actions/todo_actions"

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false,
  },
  2: {
    id: 2,
    title: "wash mom",
    body: "with shampoo",
    done: true,
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state)
  let nextState = {};
  switch (action.type) {
    case RECEIVE_TODOS:
      // let nextState = {}
      action.todos.forEach((todo) => {
        nextState[todo.id] = todo
      })
      return nextState;

    case RECEIVE_TODO: {
      let newTodo = {[action.todo.id]: action.todo}
      // ** See below for object deconstruction info **
      // let newTodo = {}
      // newTodo[action.todo.id] = action.todo
      return Object.assign({}, state, newTodo )
    }

    default:
      return state;
  }
};

export default todosReducer;
