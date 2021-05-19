import React from 'react';


class Weather extends React.Component {
    constructor(props) {
      super(props)
      this.state = {
          data: null
      }
    }

    render() {
        let weather = null;
        if (this.state.data) {
            console.log(this.state.data);
            return (
                <p>Temperature: {this.state.data.main.temp}°K</p>
            )
        }
        return (
            <div>
            <h1>This is weather.</h1>
            {weather}
            </div>
        )
    }
    
    componentDidMount() {
        navigator.geolocation.getCurrentPosition(this.pollWeather.bind(this));
    }

    pollWeather(pos) {
        let lat = pos.coords.latitude;
        let lng = pos.coords.longitude;
        const apikey = 'f816d7f39052e3a98b21952097a43076';
	    let url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${apikey}`;
        let request = new XMLHttpRequest();
        let that = this;
        request.open('GET', url, true);
        request.onload = function() {
            if (this.status >= 200) {
                that.setState({
                    data: JSON.parse(this.response)
                });
            } else {
                console.log(this.status);
            }
        };
        request.send();
    }
}


export default Weather;

// lattitude: 40.6025134
// longitude: -74.00943330000001

// api.openweathermap.org/data/2.5/weather?lat=40.6025134&lon=-74.00943330000001&appid=f816d7f39052e3a98b21952097a43076