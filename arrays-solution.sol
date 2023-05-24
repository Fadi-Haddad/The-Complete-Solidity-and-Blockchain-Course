pragma solidity >= 0.7.0 < 0.9.0;

contract learnArrays {
    
  uint[] public myArray;
  uint[] public myArray2;
  uint[200] public myFixedSizedArray;
  
    
    function push(uint number) public {
        myArray.push(number);
    }
    
    function pop() public {
        myArray.pop();
    }
    
    
    function getlength() public view returns (uint) {
        return myArray.length;
    }
    
    function remove(uint i) public {
        delete myArray[i];
        
    }
    
    // Exercise create a function that can fully remove an item from an array
    // 1. Create an Empty array called changeArray
    // 2. Create a function called removeElement which sets the index argument of the array to the last element in the array
    // 3. remove the last index from that function with the pop method
    // 4. Create a function called test which pushes 1 2 3 4 into changeArray
    // 5. remove the element 2 from the array when the contract is called
    
    uint[] public changeArray;
    
    function removeElement(uint i) public {
        changeArray[i] = changeArray[changeArray.length - 1];
        changeArray.pop();
    } 
    
    function test() public {
        changeArray.push(1);
        changeArray.push(2);
        changeArray.push(3);
        changeArray.push(4);
    }
    
    function getArray() public view returns (uint) {
        return changeArray.length;
}
}