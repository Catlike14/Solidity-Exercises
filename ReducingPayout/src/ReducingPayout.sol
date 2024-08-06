// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ReducingPayout {
    /*
        This exercise assumes you know how block.timestamp works.
        1. This contract has 1 ether in it, each second that goes by, 
           the amount that can be withdrawn by the caller goes from 100% to 0% as 24 hours passes.
        2. Implement your logic in `withdraw` function.
        Hint: 1 second deducts 0.0011574% from the current %.
    */

    // The time 1 ether was sent to this contract
    uint256 public immutable depositedTime;

    constructor() payable {
        require(msg.value == 1 ether, "You must send 1 ether");
        depositedTime = block.timestamp;
    }

    function withdraw() public {
        uint256 secondsPassed = block.timestamp - depositedTime;

        if (secondsPassed >= 1 days) {
            return;
        }

        uint256 percentualToDeduct = secondsPassed * 0.0011574 ether / 100;
        uint256 amount = address(this).balance - (address(this).balance * percentualToDeduct / 1 ether);
        (bool ok,) = msg.sender.call{value: amount}("");
        require(ok, "Cannot send");
    }
}
