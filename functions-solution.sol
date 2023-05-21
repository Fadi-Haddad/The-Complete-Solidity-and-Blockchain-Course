pragma solidity >= 0.7.0 < 0.9.0;


contract learnFunctions {
    
   //  function-name(parameter-list) scope returns() {
   //statements }
   
   function remoteControlOpen(bool closedDoor, bool openDoor ) public returns(bool) 
   {
       // all the code of the function - the script - the statement 
   }
   
    // local variables will superceed state variables    
    
   uint a = 45; // state variable
   // If we know a is always 45 - then it's smart to just instantiate a = 45 as a state variable
   
      // create a function that can add up two variables
   function addValues() public view returns (uint) {
       // all the variables that we write in the function remains localized in the function
       // uint a = 2; // local variable 
       uint b = 3;
       uint result = a + b;
       return result;
   }
   
   
   function addNewValues() public view returns (uint){
      //  uint a = 1;
       uint b = 5;
       uint result = a + b;
       return result;
   }
   
   
   
   uint b = 4; 
   
    function multiplyCalculatorByFour(uint a) public view returns (uint) {
        uint result = a * b;
        return result;
    }
    
        function divideCalculatorByFour(uint a) public view returns (uint) {
        uint result = a / b;
        return result;
    }
   
}