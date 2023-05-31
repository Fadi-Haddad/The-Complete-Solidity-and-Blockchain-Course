pragma solidity >= 0.7.0 < 0.9.0;

// function modifiers are used to modify the behavior of a function. 
// function modifiers are customizable modification for functions.
// modifiers are used to verify conditions befire running the functions which helps to save gas in contracts.

contract Owner {
    // function modifiers
    
    address owner;
    
    // when we deploy this contract we want to set the address to the owner (msg.sender)
    
    constructor() public {
        owner = msg.sender; 
    }
    
    // to write a modifier we statically declare the modifier keyword and then name it 
    // and inside we write our logic and modifications  
    modifier onlyOwner {
        // customizable logic to modify our functions 
        require(msg.sender == owner);
        _;
        // the underscore continues with the function 
    }
    // solution:
    modifier costs(uint price) {
        require(msg.value >= price);
        _;
    }
    
}


// is is a keyword grabbing inheritance from another contract - Owner

contract Register is Owner {
    
    // what in this code is currently modifying the functions? 
    
   mapping (address => bool) registeredAddresses;
   uint price;
   
   constructor(uint initialPrice) public { 
       price = initialPrice; 
       
   }
   
   // function register will set msg.sender (current caller) to true
   function register() public payable costs(price) {
       // the logic will modify the outcome 
      registeredAddresses[msg.sender] = true;
   }
   
   // onlyOwner is our function modifier that requires
   // only the owner to be able to change the price
   function changePrice(uint _price) public onlyOwner {
      price = _price;
   }
   
}

/* Exercise:
 create a function modifier called costs for our register function that checks to see 
 that the senders value (hint look up msg.value) requires to be greater than or equal 
 to the price. Second hint: The function modifier should take an argument 
*/