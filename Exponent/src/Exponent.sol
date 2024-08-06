// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Exponent {
    /*
        This exercise assumes you know how exponent works.
        1. Function `getResult` should return the result of the exponent.
    */

    function getResult(uint256 base, uint256 e)
        public
        pure
        returns (uint256)
    {
        return base ** e;
    }
}
