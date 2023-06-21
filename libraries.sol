pragma solidity >= 0.7.0 < 0.9.0;

/*
Libraries are similar to Contracts but are mainly intended for reuse. A Library contains functions which other contracts can call. 
Solidity have certain restrictions on use of a Library. Following are the key characteristics of a Solidity Library.

    Library functions can be called directly if they do not modify the state. 
    That means pure or view functions only can be called from outside the library.

    Library can not be destroyed as it is assumed to be stateless.

    A Library cannot have state variables.

    A Library cannot inherit any element.

    A Library cannot be inherited.
*/

library Search{

    function indexOf(uint[]  storage self, uint value) public view returns(uint) {
        for(uint i=0; i<self.length; i++) if(self[i] == value) return i;
    }
}
contract Test {
    uint[] data;
    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }
    
    function isValuePresent(uint val) external view returns(uint) {
       uint value = val;
       uint index = Search.indexOf(data, value); 
       return index;
    }
}