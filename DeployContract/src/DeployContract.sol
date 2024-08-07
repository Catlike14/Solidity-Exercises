// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Deployed {
    function test() public pure returns (string memory) {
        return "Hello world!";
    }
}

contract Deployer {
    /*
        This exercise assumes you know how to deploy a contract.
        1. Create an empty contract.
        2. Deploy the contract and return the address in `deployContract` function.
    */

    Deployed deployed;

    constructor() {
        deployed = new Deployed();
    }

    function deployContract() public view returns (address) {
        return address(deployed);
    }
}
