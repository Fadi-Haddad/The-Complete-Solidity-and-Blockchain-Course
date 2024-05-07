// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorgeArray;   // create an array to save the different instances of the 
                                                // simplestorage contracts

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorge = new SimpleStorage();   // creating an instance of the SimpleStorage contract
        simpleStorgeArray.push(simpleStorge);    // pushing the new instance into the SimpleStorageArray array
    }

    // a function to store a value on a smart contract in the smart contracts array
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        simpleStorgeArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    // a function to retrive the saved value on a contract with a specific index
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
       return simpleStorgeArray[_simpleStorageIndex].retrieve();
    }
}
