// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Auction{

    mapping  (address => uint ) biddersdata;
    uint highestBidAmount;
    address private  highestBidder;
    uint startTime = block.timestamp;
    uint endTime;

    //get put bidder
    function putbid() public payable {
        uint calculatebids = biddersdata[msg.sender] + msg.value;
        require(block.timestamp <=endTime ," Auction is ended");
        require(msg.value > 0 , "value must greater than zero value");
        biddersdata[msg.sender] = calculatebids;
        require(calculatebids > highestBidAmount , "highest bid Already present");
        highestBidAmount = calculatebids;
        highestBidder = msg.sender;

    }

    function getBiddersbalanced(address bidderaddress) public view returns(uint){
        return biddersdata[bidderaddress];
    }

    function getContractBalanced() public view returns(uint){
        return address(this).balance;
    }
    //get balanced of contract (only for testing)


    // get highest bid
    function HighestBid() public view returns(uint){
        return  highestBidAmount;
    }
    
    //get highest bid address
    function HighestBidder() public view  returns(address){
        return highestBidder;
    }

    // put endtime
    function putEndTime(uint _endGTime) public {
        endTime = _endGTime;
    }
    function getendTime() public  view returns(uint){
        return endTime;
    }
    function getblockTimestamp() public view  returns(uint){
        return block.timestamp;
    }
}