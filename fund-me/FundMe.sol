//SPDX-License-Identifier: MIT
pragma solidity  ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
// import "./PriceConverter.sol";

error NotOwner(); // error used in onlyOwner modifier to save gas by not sending the string with the contract

contract FundMe{
    uint constant MINIMUMUSD = 50*1e18;  // the minimum amount to send in USD, constants are usually CAPITALIZED
                                         // should be multiplied by 1e18 to get it to have 18 decimals instead of 0

    address public immutable _owner ;  // address to save the address of the person who deploys the contract

    address[] public funders;          // new array to store the list of donators(funders)

    mapping(address => uint256) public addressToAmountFunded;

    // using PriceConverter for uint256;

    function fund() public payable { // payable is added to indicate that this function either sends or receives money

        require(getExchangeRate(msg.value) > MINIMUMUSD, "amount not enough"); // if the sent amount is less than 1e18 Wei, the amount won't be sent
        // and all the code that comes AFTER the 'require' won't be 'GASED'
        // first we need a function to convert the amount from USD to wei(ETH)
        // this function is external and exists on the chain link, in order to call a function on the chainlink, we need the address and the ABI
        // the address can be found on the chainlink data PRICE FEEDS(docs.chain.link/data-feeds/price-feeds/)
        //address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI : a list of all the interactions with the bloackchain (list of functions inside a contract)

        funders.push(msg.sender);   //msg.sender is the address of whoever calls the fund function.

        addressToAmountFunded[msg.sender] = msg.value;  // stores the amount sent with the address of the sender
    }

    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); //create a variable called priceFeed from the AggregatorV3Interface
        (,int price,,,)=priceFeed.latestRoundData();
        return (uint256(price*1e10)); // price is a int256 and should be converted to uint256, also we should multiply price by 1e10 to get
                                    // to have 18 decimals instead of just 8 decimals.

    }

    function getExchangeRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice(); 
        uint256 sentAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return sentAmountInUSD;
    }

    function withdraw() public onlyOwner{ // here we have to do three things, clear the senders mapping, clear the funders array, and send the money
    
    // require(msg.send = owner);  // requiring that the owner is the only person that can withdraw the money. // replaced with a modifier
    
    // to clear the mapping, we can use a for loop:

    for (uint256 index = 0; index<funders.length; index ++ ) {

        address funder = funders[index];  // get the address of the sender from the array

        addressToAmountFunded[funder] = 0; // use the address to clear the mapping
    }

    funders = new address[](0);
    //the following code handles sending the money, generally there are three methods for sending the money :

    // payable(msg.sender).transfer(address(this).balance);

    // OR :

    // bool sent_status = payable(msg.sender).send(address(this).balance);
    // require(sent_status ,"Sending fund failed");

    // OR:
    (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call Failed");
    }

    modifier onlyOwner {
            // require(msg.sender == _owner);
            if(msg.sender != _owner) {revert NotOwner();}
            _;  // this code tell the compiler to continue the rest of the code starting here.
        }


    // if date was sent to the contract with a transaction, the default function to be called will be fallback, if data was empty and there is 
    // a receive function, the receive function will be called.
    // if Ether is sent to the contract without any data, the receive function will be called.
    // If Ether is sent with data, or if no data is sent and there is no receive function, the fallback function will be called.
    receive () external payable {
        fund();
    }

    fallback () external payable{
        fund();
    }
}