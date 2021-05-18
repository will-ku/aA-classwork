import React from 'react';
import Header from './header';


class Tabs extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            selectedTab: 0,
        }
    }

    render() {
        return (
            <div>
                <h1>Tabs</h1>
                <ul>
                    <Header title="one" />
                    <Header title="two" />
                    <Header title="three" />
                </ul>
            </div>
        )
    }
}

export default Tabs;