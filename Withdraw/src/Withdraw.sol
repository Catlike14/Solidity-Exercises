// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Withdraw {
    // @notice make this contract able to receive ether from anyone and anyone can call withdraw below to withdraw all ether from it
    receive() external payable {

    }

    function withdraw() public {
        uint256 amount = address(this).balance;
        (bool ok,) = msg.sender.call{value: amount}("");
        require(ok, "Transaction failed");
    }
}
