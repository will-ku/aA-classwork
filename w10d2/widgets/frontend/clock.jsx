import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            date: new Date()
        }
        this.tick = this.tick.bind(this);
        this.timerId = null;
        // this.tick != this.tick
        // located on the instance vs Clock.prototype
    }


    render() {
        return (
            <div className='clock'>
                <h1>this is time:</h1>
                <p>{this.state.date.getHours()}:{this.state.date.getMinutes()}:{this.state.date.getSeconds()}</p>
            </div>
        )
    }

    tick() {
        this.setState({
            date: new Date()
        })
    }

    componentDidMount() {
        this.timerId = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.timerId);
    }
}

export default Clock;