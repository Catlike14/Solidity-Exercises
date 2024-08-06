// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Fibonacci {
    /*
        This exercise assumes you understand what Fibonacci sequence is.
        1. Function `fibonacci` takes a uint256 as argument and returns nth fibonacci number.
        
        Fibonacci sequence are 0,1,1,2,3,5,8,13,....
        
        calling fibonacci(6) would return 8, because the 6th Fibonacci number is 8.
    */

    function fibonacci(uint256 position) public pure returns (uint256) {
        if (position < 2) {
            return position;
        }

        uint256 x = 0;
        uint256 y = 1;

        for (uint256 p = 2; p <= position; p++) {
            (x, y) = (y, x+y);
        }

        return y;
    }
}
