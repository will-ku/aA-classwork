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
                <h2 className = "weather">Temperature: {this.state.data.main.temp}°K
                <br />
                Location: {this.state.data.name}</h2>
            )
        }
        return (
            <div>
            <h2 className = "weather"> Loading...</h2>
            {weather}
            </div>
        )
    }
    
    componentDidMount() {
        navigator.geolocation.getCurrentPosition(this.pollWeather.bind(this));
    }

    pollWeather(pos) {
        // all of this will be used to fill out request.open
        let lat = pos.coords.latitude;
        let lng = pos.coords.longitude;

        const apikey = 'f816d7f39052e3a98b21952097a43076';
	      let url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${apikey}`;
        
        let request = new XMLHttpRequest();
        
        request.open('GET', url, true);
        
        //this is when we receive the request and we need that = this
        // self sufficient - when it tries to carry out the action, it has everything it needs aka 'that'
        let that = this;
        request.onload = function() { 
          if (this.status === 200) {
            that.setState({
              data: JSON.parse(this.response)
            });
          } else {
            console.log(this.status);
          }
        };
        
        request.send(); // this executes first, but we still need to define onload before sending. that is why we like to put this at the bottom
    }
}


export default Weather;

// lattitude: 40.6025134
// longitude: -74.00943330000001

// api.openweathermap.org/data/2.5/weather?lat=40.6025134&lon=-74.00943330000001&appid=f816d7f39052e3a98b21952097a43076