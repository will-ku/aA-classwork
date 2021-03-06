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
            this.setState({selectedTab: tabIdx})
        }
    }

    render() {
        const headers = this.props.input.map( (tab, i) => {
            // console.log(this.state.selectedTab, i)
            if (this.state.selectedTab === i) {
                return <Header 
                    selected={true}
                    key={i} 
                    title={tab.title}
                    setSelectedTab={this.setSelectedTab(i)}/>
            } else {
                return <Header 
                    key={i} 
                    title={tab.title}
                    setSelectedTab={this.setSelectedTab(i)}/>
            }
        })
        return (
            <h2 className = "tabs">
                {/* <div> {this.state.selectedTab}</div> */}
                <ul>
                    {headers}
                </ul>
                <article>
                    {/* {this.props.input[this.state.selectedTab].content} */}
                </article>
            </h2>
        )
    }
}

export default Tabs;