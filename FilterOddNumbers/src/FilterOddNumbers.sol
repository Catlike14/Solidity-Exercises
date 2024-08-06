// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
    */

    function filterOdd(uint256[] memory arr)
        public
        pure
        returns (uint256[] memory)
    {
        uint256 evenCounter = 0;

        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evenCounter++;
            }
        }

        uint256[] memory evens = new uint256[](evenCounter);

        uint256 j = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evens[j++] = arr[i];
            }
        }

        return evens;
    }
}
