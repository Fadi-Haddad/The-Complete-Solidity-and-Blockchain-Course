//SPDX-License-Identifier: MIT
pragma solidity  ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint minimumUSD = 50;  // the minimum amount to send in USD

    function fund() public payable { // payable is added to indicate that this function either sends or receives money

        require(getExchangeRate(msg.value) > minimumUSD, "amount not enough"); // if the sent amount is less than 1e18 Wei, the amount won't be sent
                                                             // and all the code that comes AFTER the 'require' won't be 'GASED'
        //First we need a function to convert the amount from USD to wei(ETH)
        // this function is external and exists on the chain link, in order to call a function on the chainlink, we need the address and the ABI
        // the address can be found on the chainlink data PRICE FEEDS(docs.chain.link/data-feeds/price-feeds/)
        //address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI : a list of all the interactions with the bloackchain (list of function inside a contract)
        
    }

    function getPrice() public {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); //create a variable called priceFeed from the AggregatorV3Interface
        (,int price,,,)=priceFeed.latestRoundData();
        return (uint256(price)*1e10) // price is a int256 and should be converted to uint256, also we should multiply price by 1e10 to get
                                    // to have 18 decimals instead of just 8 decimals.

    }

    function getExchangeRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice(); 
        uint256 sentAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return sentAmountInUSD;
    }

    function withdraw() public {}

}