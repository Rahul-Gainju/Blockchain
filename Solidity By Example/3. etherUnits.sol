/// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract etherUnits{
    uint public oneWei = 1 wei;
    uint public oneEther = 1 ether;
    
    function testoneWei() public pure returns (bool)  {
        return 1 wei == 1;
    }

    function testoneEther() public pure returns (bool){
        return 1 ether == 1e18 wei;
    }

} 