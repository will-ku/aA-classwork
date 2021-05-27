export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  user,
});

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
})

export const receiveErrors = (errors) => ({

})



// THUNK

export const login = (user) => ({
  
})

export const logout = () => ({

})

export const signup = (user) => ({

})