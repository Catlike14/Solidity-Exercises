// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
import "forge-std/console.sol";


contract Typecast {
    /**
     * the goal of this exercise is to pass if msg.value is equal to the address of this contract or revert otherwise
     */

    function typeCast() external payable {
        uint256 value = uint256(uint160(address(this)));
        require(msg.value == value, "Sender is not equal to value");
    }
}
