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
    
}