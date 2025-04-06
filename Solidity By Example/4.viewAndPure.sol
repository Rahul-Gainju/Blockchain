/// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract viewAndPure {
    uint public x = 1;

    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}