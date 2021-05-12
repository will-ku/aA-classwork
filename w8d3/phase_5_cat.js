function Cat (name, owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement () {
    console.log(`${this.owner} loves ${this.name}!`)
}