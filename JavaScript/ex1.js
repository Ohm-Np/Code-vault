// 1
console.log(true && false);

// 2
console.log((true && false) || true);

// 3
let x = 10; 
let y = (x > 10) ? 1 : 0;
console.log(y);

// 4
let z = (2 + 3) * (4 + 5);
console.log(z);

// Exercise - Swapping variables

let a = 'red';
let b = 'blue';

let c = a;
a = b;
b = c;

console.log(a);
console.log(b);
