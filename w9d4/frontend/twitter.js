const FollowToggle = require('./follow_toggle.js');

const setEventListeners = () => {
// select all toggle buttons
// iterate through collection and call new followToggle on each ele
// #each is a jQuery obj
// in this #each method, we create new followToggles which give render, handleClick, etc
    $(`button.follow-toggle`).each( (idx, button) => {
        //this is not a jQuery object, we will need to convert
        const a = new FollowToggle(button)
    })



}

$(setEventListeners); 
// until all HTML has loaded, then you can run JS
//this is jQuery shorthand equivalent of saying document.addEventListener(DOMContentLoaded)

