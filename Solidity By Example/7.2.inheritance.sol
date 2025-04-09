/// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract A{
    function foo( ) public pure virtual returns (string memory){
        return "A";
    }
}

contract B{
    function foo() public pure virtual returns (string memory){
        return "B";
    } 
}
// solidity now uses c3 linearization 
contract C is A,B {
    function foo() public pure override(A,B) returns (string memory){
        return "C";
    }
    //calling contract A
    function fooA() public pure returns (string memory){
        return A.foo();
    }
    //calling contract B
    function fooB() public pure returns (string memory){
        return B.foo();
    }
}

// super key word can be use to call all parent contract
    //event
contract D{
    event Log(string message);
    function boo() public virtual {
        emit Log("D.boo was called");
    }
    function bar() public virtual{
        emit Log("D.bar was called");
    } 
}

contract E is D{
    function boo() public virtual override{
        emit Log("E.boo was called");
        D.boo();
    }
    function bar() public virtual override{
        emit Log("E.bar was called");
        super.bar();
    }
}

contract F is E{
    function boo() public override{
        emit Log("F.boo was called");
        D.boo();
    }
    function bar() public override{
        emit Log("F.bar was called");
        //E.bar(); 
       super.bar(); // you can call all parent by using super or call single using E.bar like above;
    }
}

contract G is F{}

