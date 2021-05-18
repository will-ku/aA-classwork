import React from 'react';


class Weather extends React.Component {
    constructor(props) {
      super(props)
    }

    render() {
      return (
        <div>
          <h1>This is weather.</h1>
        </div>
      )
    }
    
    componentDidMount() {
        navigator.geolocation.getCurrentPosition(this.pollWeather);
    }

    pollWeather() {
	    let url = 'api.openweathermap.org/data/2.5/weather?lat=40.6025134&lon=-74.00943330000001&appid=f816d7f39052e3a98b21952097a43076';
      let xmlhttp = new XMLHttpRequest();
        request = new XMLHttpRequest();
        request.open('POST', url, true);
        request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
        request.send(data);
        xmlhttp.send();
    }

}


export default Weather;

// lattitude: 40.6025134
// longitude: -74.00943330000001

// api.openweathermap.org/data/2.5/weather?lat=40.6025134&lon=-74.00943330000001&appid=f816d7f39052e3a98b21952097a43076