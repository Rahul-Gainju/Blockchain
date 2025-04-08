/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*
Examples
    -inheritance functions
    -overide functions

-passsing parameters to parent cunctructor
    -fixed paramenters
    -variable parameters
*/

//inheritance

contract A{
    function getContractName() public pure virtual returns (string memory){
        return "Contract A";
    }
}

contract B is A{
    function getContractName() public pure override returns (string memory){
        return "Contrat B";
    }
}

//parameters
contract C{
    string public name;

    constructor (string memory _name)  {
        name = _name;
    } 
}

contract D is C {
    constructor (string memory _name) C(_name)  {
    }
}