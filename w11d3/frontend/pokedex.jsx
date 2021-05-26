import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import pokemonReducer from './reducers/pokemon_reducer'
import { receivePokemon } from './actions/pokemon_actions'
import { fetchPokemon } from './util/api_util'

const store = configureStore();
window.store = store

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, rootEl)
})

window.fetchPokemon = fetchPokemon
window.receivePokemon = receivePokemon
