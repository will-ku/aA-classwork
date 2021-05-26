import { RECEIVE_POKEMON } from "./../actions/pokemon_actions";


export const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_POKEMON:
      return Object.assign({}, state, action.pokemon.items);
    default:
      return state;
  }
};
