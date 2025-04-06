/// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract simpleStorage {
    string public text;    //store the text

    // a public function to update the text variable
    function set(string memory _text) public{
        text = _text;
    }
    // public function to get the text variable
    function get() public view returns (string memory){
        return text;
    }
}