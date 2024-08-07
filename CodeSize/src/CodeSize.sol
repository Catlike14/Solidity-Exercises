// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CodeSize {
    /**
     * The challenge is to create a contract whose runtime code (bytecode) size is greater than 1kb but less than 4kb
     */
     
    // Add random fields here to increase the code size
    struct Person {
        string firstName;
        string lastName;
        string nickname;
    }
    Person[] public array;

    function push(Person calldata newElement) public {
        array.push(newElement);
    }

    function pop() public returns (Person memory lastElement) {
        lastElement = array[array.length - 1];
        array.pop();
    }
}
