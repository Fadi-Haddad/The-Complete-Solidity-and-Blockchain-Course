/* write a function to return funds using the withdrawal pattern.

1. Write a function called withdrawFunds that takes an amount and returns bool success in the signature.
2. Require that the balance of the current caller is greater than or equal to the amount.
3. subtract the amount from the balance of the current sender
4. transfer the amount over and return the trueness of the function 

*/

pragma solidity >= 0.7.0 < 0.9.0;

function withdrawFunds(uint amount) public returns(bool success) {
    require(balance[msg.sender] >= amount); 
    balance[msg.sender] -= amount; 
    msg.sender.transfer(amount);
    return true;
}
