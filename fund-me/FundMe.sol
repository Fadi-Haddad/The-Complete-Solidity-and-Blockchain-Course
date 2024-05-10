//SPDX-License-Identifier: MIT
pragma solidity  ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
// import "./PriceConverter.sol";

contract FundMe{
    uint minimumUSD = 50*1e18;  // the minimum amount to send in USD,
                                // should be multiplied by 1e18 to get it to have 18 decimals instead of 0

    address[] public funders; // new array to store the list of donators(funders)

    mapping(address => uint256) public addressToAmountFunded;

    address public owner ;  // address to save the address of the person who deploys the contract

    constructor(){ // a constructor is a function that runs automatically exactly ONCE whenever the contract is deployed.

        owner = msg.sender; 
    }

    // using PriceConverter for uint256;

    function fund() public payable { // payable is added to indicate that this function either sends or receives money

        require(getExchangeRate(msg.value) > minimumUSD, "amount not enough"); // if the sent amount is less than 1e18 Wei, the amount won't be sent
         // and all the code that comes AFTER the 'require' won't be 'GASED'
        //First we need a function to convert the amount from USD to wei(ETH)
        // this function is external and exists on the chain link, in order to call a function on the chainlink, we need the address and the ABI
        // the address can be found on the chainlink data PRICE FEEDS(docs.chain.link/data-feeds/price-feeds/)
        //address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI : a list of all the interactions with the bloackchain (list of function inside a contract)

        funders.push(msg.sender);   //msg.sender is the address of whoever calls the fund function.

        addressToAmountFunded[msg.sender] += msg.value;  // stores the amount sent with the address of the sender
    }

    function getPrice() public view returns (uint256){                          // can be moved to PriceConverter.sol
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); //create a variable called priceFeed from the AggregatorV3Interface
        (,int price,,,)=priceFeed.latestRoundData();
        return (uint256(price*1e10)); // price is a int256 and should be converted to uint256, also we should multiply price by 1e10 to get
                                    // to have 18 decimals instead of just 8 decimals.

    }

    function getExchangeRate(uint256 ethAmount) public view returns(uint256){  // can be moved to PriceConverter.sol
        uint256 ethPrice = getPrice(); 
        uint256 sentAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return sentAmountInUSD;
    }

    function withdraw() public {} // here we have to do three things, clear the senders mapping, clear the funders array, and send the money
    // to clear the mapping, we can use a for loop:

    require(msg.send = owner);  // requiring that the owner is the only person that can withdraw the money.

    for (uint256 index = 0, index<=funders.length, index ++ ) {

        address funder = funders[index]  // get the address of the sender from the array

        addressToAmountFunded[funder] = 0; // use the address to clear the mapping
    }

    funders = new address[](0);

    (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call Failed");

}