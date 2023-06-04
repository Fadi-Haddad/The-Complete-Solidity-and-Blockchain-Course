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
        'Sender not authorized!'
        );
        _;
    } 

    
    function changeOwnerAddress(address _newAddress) onlyBy(owner) public {
        owner = _newAddress;
    }
    
}