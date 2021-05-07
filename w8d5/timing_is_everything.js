class Clock {
  constructor() {
    // 1. Create a Date object.
    const time = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = time.getHours();
    this.minutes = time.getMinutes();
    this.seconds = time.getSeconds();
    // 3. Call printTime.
    this.printTime()
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000)
  }

  printTime() {
      let currentTime = `${this.hours}:${this.minutes}:${this.seconds}`
      console.log(currentTime)
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    this.incrementSeconds();
    console.log(printTime());
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }

  incrementSeconds() {
    this.seconds += 1;
    if (this.seconds === 60) {
        this.seconds = 00
        incrementMinutes()
    }
}

incrementMinutes() {
    this.minutes += 1;
    if (this.minutes === 60) {
        this.minutes = 00
        incrementHours()
  }

  incrementHours() {
    this.hours += 1;
    if (this.hours === 24) {
        this.hours = 00
    }
    else {
        return this.hours
    }

  }
}

const clock = new Clock();