// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{  // 'is' here means that ExtraStorage extends the SimpleStorage contract
    function  store (uint _favNumber) public override{ // the 'override' keyword is used to override... 
            favNumber = _favNumber+5;                 // previously defined functions (store)
        }
}