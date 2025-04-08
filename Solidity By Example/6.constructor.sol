/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract A {
    uint public x;
    uint public y;

    address public owner;
    uint public createdAt;

    constructor(uint _x, uint _y)  {
        x = _x;
        y = _y;

        owner = msg.sender;
        createdAt = block.timestamp;
    }
}

