// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FizzBuzz {
    function fizzBuzz(uint256 n) public pure returns (string memory) {
        bool by3 = n % 3 == 0;
        bool by5 = n % 5 == 0;

        if (by3 && by5) {
            return "fizz buzz";
        }

        if (by3) {
            return "fizz";
        }

        if (by5) {
            return "buzz";
        }

        return "";

        // if n is divisible by 3, return "fizz"
        // if n is divisible by 5, return "buzz"
        // if n is divisible be 3 and 5, return "fizz buzz"
        // otherwise, return an empty string
    }
}
