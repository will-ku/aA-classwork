import React from "react";
import { HashRouter } from 'react-router-dom';
import App from './app'
import { Provider } from "react-redux";

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>
);