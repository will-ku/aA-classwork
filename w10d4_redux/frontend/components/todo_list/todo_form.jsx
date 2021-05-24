import React from 'React'
import {receiveTodo} from '../../actions/todo_actions'
import {uniqueId} from '../../util/id_generator'

// for a form, you will want local state (thing you're creating),

class TodoForm extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      title: "",
      body: "",
      done: false
    };

    this.handleTitle = this.handleTitle.bind(this)
    this.handleBody = this.handleBody.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
// e stands for event (is an object). onChange is the event that is firing
// e.target is the input field
  handleTitle(e) {
    this.setState({
      title: e.target.value
    })
  }

  handleBody(e) {
    this.setState({
      body: e.target.value
    })
  }

  handleSubmit(e) {
    // default action of form submission is to make an HTTP request
    // just always put this into forms
    e.preventDefault()
    // this needs to update the global state in the store
    // needs to call receiveTodo(todo) which takes in a todo object
    // our todo object will be represented by the local state of this component
    
    // console.log(this.state)
    // console.log("this is props", this.props)
    const todo = Object.assign({}, this.state, { id: uniqueId() })
    this.props.receiveTodo(todo)
    this.setState({
      title: "",
      body: "",
      done: false
    })
  }

  render () {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          
          <label>Title:
            <input onChange={this.handleTitle} type="text" value={this.state.title} />
          </label>

          <label>Body:
            <input onChange={this.handleBody} type="text" value={this.state.body} />
          </label>
          
          <button>Submit!</button>
          
        </form>
      </div>
    )
  }
  
}

export default TodoForm