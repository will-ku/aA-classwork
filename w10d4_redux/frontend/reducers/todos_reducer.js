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
    title: "wash dog",
    body: "with shampoo",
    done: true,
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state)
  switch (action.type) {
    case RECEIVE_TODO: {
      let nextState = Object.assign({}, state)
      const {id, title, body, done} = action
      nextState[id] = {id, title, body, done}
      return nextState
    }

    case RECEIVE_TODOS:
      const nextState = Object.assign({}, state)
      action.todos.forEach((todo) => {
        const {id, title, body, done} = todo
        nextState[id] = {id, title, body, done}
        // if you want value as key, you have to use bracket notation
      })
      // nextState[action.todos.id] = action.todos
      return nextState;
    
    default:
      return state;
  }
};

export default todosReducer;
