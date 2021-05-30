// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', () => {
    const priceBeforeTax = itemPrice.value;
    const taxPrice = document.getElementById('add-tax-price');
    const Price = priceBeforeTax / 10;
    const priceAfterTax = Math.round(Price);
    taxPrice.innerHTML = `${priceAfterTax}`;
    const Profit = document.getElementById('profit');
    const profitAfter = priceBeforeTax - priceAfterTax;
    Profit.innerHTML = `${profitAfter}`;
  })   
  })


