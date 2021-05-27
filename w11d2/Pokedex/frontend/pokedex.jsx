import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';
import {fetchAllPokemon} from './util/api_util';
import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  const rootEl = document.getElementById('root');
  window.dispatch = store.dispatch;
  window.getState = store.getState;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});