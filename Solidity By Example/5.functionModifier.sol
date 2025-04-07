/// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract functionModifier{
    //1. Restricting write access (basic system)
    //2. Validate inputs. (inputs, why useful?)
    //3. Reentracy guard (reentrancy hack)

    address public owner;

    constructor()  {
        owner = msg.sender;
    }

    modifier onlyOwner()  {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    modifier validateAddress(address _addr)  {
        require(_addr != address(0), "Not a valid address");
        _;
    }
    
    function changeOwner(address _newOwner) public onlyOwner validateAddress(_newOwner){ 
        owner = _newOwner;
    }
    uint public x = 10;
    bool locked;

    modifier noReentrancy{
        require(!locked, "Locked");

        locked = true;
        _;
        
        locked = false;
    }
    function decrement(uint i) public noReentrancy{
        x -= i;
        if (i > 1) {
            decrement (i - 1);
        } 
    }
}