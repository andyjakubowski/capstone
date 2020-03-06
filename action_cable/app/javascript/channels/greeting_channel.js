import consumer from "./consumer"

const animals = ['Tiger', 'Puma', 'Elephant', 'Dog', 'Cow'];

const getRandomInt = function getRandomInt(min, max) {
  const minCeil = Math.ceil(min);
  const maxFloor = Math.floor(max);
  return Math.floor(Math.random() * (maxFloor - minCeil)) + minCeil; //The maximum is exclusive and the minimum is inclusive
};

const updateName = function updateName(name) {
  const h1 = document.getElementById('title');
  h1.innerText = `Your assigned name: ${randomAnimal}`;
};

const randomIndex = getRandomInt(0, animals.length);
const randomAnimal = animals[randomIndex];

consumer.subscriptions.create({ channel: "GreetingChannel", animal: randomAnimal }, {
  connected() {
    // Called when the subscription is ready for use on the server
    // console.log('Your assigned name is ');
    // this.say_hi();
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    // console.log('Disconnected from GreetingChannel');
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const h2 = document.createElement('h2');
    h2.innerText = `${data['message']}`;
    document.body.append(h2);
  },

  say_hi: function() {
    return this.perform('say_hi');
  }
});

if (document.readyState !== 'loading') {
  updateName();
} else {
  document.addEventListener('DOMContentLoaded', updateName)
}
