import React from 'react';
import Header from './header';


class Tabs extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            selectedTab: 0,
        }
    }

    setSelectedTab(tabIdx) {
        return () => {
            this.setState({
                selectedTab: tabIdx
            })
        }
    }

    render() {
        return (
            <div>
                <h1>Tabs {this.state.selectedTab}</h1>
                <ul>
                    <Header title="one" setSelectedTab={this.setSelectedTab(0)}/>
                    <Header title="two" setSelectedTab={this.setSelectedTab(1)}/>
                    <Header title="three" setSelectedTab={this.setSelectedTab(2)}/>
                </ul>
            </div>
        )
    }
}

export default Tabs;