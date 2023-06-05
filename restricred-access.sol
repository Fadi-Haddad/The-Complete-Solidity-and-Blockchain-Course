pragma solidity >= 0.7.0 < 0.9.0;

contract RestrictedAcces {
    
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;
    
    // write a modifier called onlyBy that will require the current caller to be equal to 
    // an account address which we set as an input in the modifier and if 
    // the requirement fails send a message that says - Sender not authorized!
    
    // solution:
    modifier onlyBy(address _account) {
        require(msg.sender == _account,
        'Sender not authorized!');
        _;
    } 

    // write a function that can disown the current owner 
    // only run the function 10 seconds after the creation of the contract 

    // solution:
    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time,
        'function is called too early!');
        _;
    }

    function disown() onlyBy(owner) onlyAfter(creationTime + 10 seconds) public {
        delete owner;
    } 

    function changeOwnerAddress(address _newAddress) onlyBy(owner) public {
        owner = _newAddress;
    }

    /*
    Exercise: 
    1. Create a modifier called costs which takes an _amount parameter
    2. Require that msg.value is greater than or equal to the amount 
    3. If the msg.value is not greather than or equal to the amount 
       return a string that says Not enough Ether provided. 
    4. Write a funciton called forceOwnerChange which takes an address called _newOwner and is payable 
    5. add a modification to the signature so that the function needs 200 ether to execute 
    6. set the owner of the contract to the new owner of the address.
    */

    // Solution:

    modifier costs(uint _amount) {
        require(msg.value >= _amount,
        'Not enough Ether provided');
        _;
    }
    
    function forceOwnerChange(address _newOwner) payable costs(200 ether) public {
        owner = _newOwner;
    }

}