titleize = function(arr,callback) {
    let new_words = arr.map(word => `Mx. ${word} Jingleheimer Schmidt`);
    callback(new_words);
};

function Elephant(name,height,tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
};

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
};

Elephant.prototype.grow = function() {
    this.height++;
};

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick)
};

