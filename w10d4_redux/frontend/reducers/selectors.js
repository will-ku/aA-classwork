export const allTodos = (state) => {
  const todoArray = Object.values(state.todos);
  return todoArray
}