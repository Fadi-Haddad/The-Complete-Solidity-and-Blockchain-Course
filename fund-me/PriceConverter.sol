//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// Libraries are similar to contracts with the difference of not having the ability to have state variables.
// And Can Not send Ether.

// functions inside a library have to be internal.

//Using this library, we can now use the functions inside this library in other contracts and call the functions directly or as methods.

// for example : in fundme.sol we can use :
//      getExchangeRate(msg.value)  OR 
//      msg.value.getExchangeRate(), notice that msg.value is te first parametrs and other parameters can be passed in the () 
// we also ave to import the library wherever we want to use it...
// and we should also use :
//      using PriceConverter for uint256



import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
        (,int price,,,)=priceFeed.latestRoundData();
        return (uint256(price*1e10));

    }

    function getExchangeRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice(); 
        uint256 sentAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return sentAmountInUSD;
    }
}