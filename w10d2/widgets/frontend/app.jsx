import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

function App () {

    const tabsInput = [
        {title: "one", content: "tab 1"},
        {title: "two", content: "tab 2"},
        {title: "three", content: "tab 3"}
    ]

    return (
        <div>
            <Clock/>
            <Tabs input={tabsInput} />
        </div>
    )
}

export default App;