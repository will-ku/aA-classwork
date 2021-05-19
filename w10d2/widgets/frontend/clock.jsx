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
            <h2 className='clock'> Current Time:
                <p>{this.state.date.getHours()}:{this.state.date.getMinutes()}:{this.state.date.getSeconds()}</p>
            </h2>
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