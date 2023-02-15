// logical and (&&)
// Returns TRUE if both operands are TRUE

console.log(false && true);

let highIncome = true;
let goodCreditScore = true;
let eligibleForLoan = highIncome && goodCreditScore;
console.log(eligibleForLoan);


// logical OR (||)
Returns TRUE if one of the operands is TRUE
let highIncome = false;
let goodCreditScore = true;
let eligibleForLoan = highIncome || goodCreditScore;
console.log(eligibleForLoan);


// logical NOT (!)
// Returns TRUE if one of the operands is TRUE
let highIncome = false;
let goodCreditScore = false;
let eligibleForLoan = highIncome || goodCreditScore;
console.log('Eligible', eligibleForLoan);

let applicationRefused = !eligibleForLoan;
console.log('Application Refused', applicationRefused);


