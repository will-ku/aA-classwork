export const signup = user => (
  $.ajax({
    method: 'POST',
    path: '/api/users',
    data: { user }
  })
)

export const login = user => (
  $.ajax({
    method: 'POST',
    path: 'api/session',
    data: { user }
  })
)

export const logout = () => (
  $.ajax({
    method: 'DESTROY',
    path: '/api/session'
  })
)