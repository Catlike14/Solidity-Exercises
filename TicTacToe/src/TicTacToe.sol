// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        // check rows
        for (uint8 i = 0; i < 2; i++) {
            if (lineIsWinning(board[i])) {
                return true;
            }
        }

        // check columns
        for (uint8 i = 0; i < 2; i++) {
            uint8[3] memory column = [board[0][i], board[1][i], board[2][i]];
            if (lineIsWinning(column)) {
                return true;
            }
        }

        // check diagonals
        if (lineIsWinning([
            board[0][0], board[1][1], board[2][2]
        ])) {
            return true;
        }

        if (lineIsWinning([
            board[0][2], board[1][1], board[2][0]
        ])) {
            return true;
        }

        return false;
    }

    function lineIsWinning(uint8[3] memory line) internal pure returns (bool) {
        return (line[0] == line[1]) && (line[1] == line[2]);
    }
}
