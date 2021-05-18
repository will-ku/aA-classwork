import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            date: new Date()
        }
        this.tick = this.tick.bind(this)
        // this.tick != this.tick
        // located on the instance vs Clock.prototype
    }


    render() {
        return (
            <h1>this is clock.</h1>
        )
    }

    tick() {
        this.setState({
            date: new Date()
        })
    }

    componentDidMount() {
        setInterval(this.tick, 1000)
    }

}

export default Clock;