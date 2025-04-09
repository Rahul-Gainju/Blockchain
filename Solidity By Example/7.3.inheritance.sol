/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
/*
-Multiple Inheritance and constructor
-Calling parent constructor
-Oder of constructor intillizations
-Shadowning inherited state variable
*/


contract X{
    event LogX(string message);
    string public name;
    constructor(string memory _name){
        name = _name;

        emit LogX(_name);
    }
}

contract Y{
    string public text;
    event LogY(string message);
    constructor(string memory _text){
        text = _text;
        
        emit LogY(_text); 
    }
}

contract B is X("Fixed Input"), Y("Another Fixed Input"){}
// we can call parent contract like contract B C or D where D is passing variable;
contract C is X,Y{
    constructor()X("Fixed Input") Y("Another Fixed Input"){

    }
}

contract D is X, Y{
    constructor(string memory _name, string memory _text) X(_name) Y(_text){

    }
}

//to see the order of intillization
// the order depends upon inheritance not by the parent.

contract E is X, Y{
    constructor()X("X Was called") Y("Y was Called!"){}
}

contract F is X, Y{
    constructor() Y("Y was called!") X("X was called"){}
}

//example of overiding state veriable in a parent contract
contract G{
    address public addr = 0x0000000000000000000000000000000000000001;

    function getAddress()public view returns(address){
        return addr;
    }
}

contract H is G{
    constructor(){
        addr = 0x0000000000000000000000000000000000000002;
    }
}
