import React from 'react';


class Header extends React.Component {

    constructor(props) {
        super(props)
    }

    render() {
        console.log(this.props)
        if (this.props.selected) {
            return (
                <li className="selected" onClick={this.props.setSelectedTab}>
                    {this.props.title}
                </li>
            )
        } else {
            return (
                <li onClick={this.props.setSelectedTab}>
                    {this.props.title}
                </li>
            )
        }
    }
}

export default Header;