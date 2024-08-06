// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    struct Bet {
        uint256 amount;
        uint256 timestamp;
        address bidder;
    }

    Bet private highestBet;

    constructor() {
        highestBet = Bet(0, 0, address(0));
    }
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */

    function bet() public payable {
        if (msg.value > highestBet.amount) {
            highestBet = Bet(msg.value, block.timestamp, msg.sender);
        }
    }

    function claimPrize() public {
        require(msg.sender == highestBet.bidder, "Nice try, loser!");
        require(block.timestamp > highestBet.timestamp + 1 hours, "Nice try, champion!");
        (bool ok,) = msg.sender.call{value: address(this).balance}("");
        require(ok, "Cannot transfer");
    }
}
