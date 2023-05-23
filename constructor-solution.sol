/*
Exercise:
1. Create a contract called Base which stores full accessible (inside and outside) data upon deployment 
2. Create a contract called Derived which derives the data from base and runs a function that 
   always outputs the data to the integer 5. 
*/

contract Base {
   uint data;
   constructor(uint _data) public {
      data = _data;   
   }
}

contract Derived is Base (5) {
   function getData() public view returns(uint) {
       return data;
   }   
}