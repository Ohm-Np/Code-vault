console.log(false || 'Ohm');

// Falsy (false) values in JavaScript
// undefined
// null
// 0 
// false
// ''
// NaN

// Anything that is not falsy -> truthy

// Short-circuiting
console.log(false || 2 || 1);

// example - pick the color or default color
let userColor = undefined;
let defaultColor = 'blue';
let currentColor = userColor || defaultColor;

console.log(currentColor);