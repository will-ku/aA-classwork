import { RECEIVE_POKEMON } from "./../actions/pokemon_actions";

export const movesReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_POKEMON:
      return Object.assign({}, state, action.pokemon.moves);
    default:
      return state;
  }
};
