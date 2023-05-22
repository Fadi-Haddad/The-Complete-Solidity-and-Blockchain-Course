pragma solidity >= 0.7.0 < 0.9.0;

contract learnStrings {   
    
    string greetings = 'hello!'; 

    function sayHello() public view returns(string memory) {
        
         greetings;
    }
    
    function changeGreetings(string memory change) public {
         greetings = change;
    }
    
    function getStringLength() public view  returns(uint) {
        bytes memory stringToBytes = bytes(greetings);
        return stringToBytes.length;
    }
    
    string favoriteColor = 'blue';
    
    function getColor() public view returns (string memory) {
        return favoriteColor;
    }
    
    
    function changeColor(string memory _color) public {
        favoriteColor = _color;
    }
    
    function getColorLength() public view returns(uint) {
        bytes memory stringToBytes = bytes(favoriteColor);
        return stringToBytes.length;
    }
    
}