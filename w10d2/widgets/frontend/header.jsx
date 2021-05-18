import React from 'react';


class Header extends React.Component {

    constructor(props) {
        super(props)
    }

    render() {
        return (
            <li onClick={this.props.setSelectedTab}>
                {this.props.title}
            </li>
        )
    }
}

export default Header;