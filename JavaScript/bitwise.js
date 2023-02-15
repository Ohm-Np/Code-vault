// What are bitwise operators?

// binary - combination of 0 & 1
// decimal to binary examples
// 1 = 00000001 - 8 bits/digits
// 2 = 00000010
// 3 = 00000011

// Bitwise OR (|)
console.log(1 | 2);

// Bitwise AND (&)
console.log(1 & 2);

// Real world example:
// access control system (Read, Write, Execute)
// 00000100 - Read
// 00000110 - Write
// 00000001 - Execute

const readPermission = 4;
const writePermission = 2;
const executePermission = 1;

let myPermission = 0;
myPermission = myPermission | readPermission | writePermission;

let message = 
    (myPermission & readPermission) ? 'yes': 'no';

console.log(message);

// Note: bitwise OR - add permissions
//       bitwise AND - check to see if we have a given permission