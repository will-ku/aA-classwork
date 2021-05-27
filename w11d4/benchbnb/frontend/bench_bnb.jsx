import React from "react";
import ReactDOM from "react-dom";
import { signup, login, logout } from './util/session_api_util'

window.signup = signup
window.login = login

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});