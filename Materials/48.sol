pragma solidity ^0.4.24;

/*
Try to deploy contracts onto blockchain one by one and differentiate the GAS fee between contracts
Hint: one execute costs 32 bytes (256 bits)
*/
contract class481 {

    uint64 public a;
    uint64 public b;
    uint64 public c;
    uint64 public d;

    function test() public {
        a = 1;
        b = 2;
        c = 3;
        d = 4;
    }
}

contract class482 {

    uint64 public a;
    uint64 public b;
    address e;
    uint64 public c;
    uint64 public d;

    function test() public {
        a = 1;
        b = 2;
        c = 3;
        d = 4;
    }
}

/*
One "public" ---> cost 22 GAS (accumulated) !! 
Hence, frequently used functions should be inserted firstly in a contract.
*/
contract class483 {

    address public addr;

    function func1() public { // when execute funct1(), +22 GAS
    }
    
    function func2() public { // when execute funct2(), +44 GAS
    }
}

/*
1. Decrease the number of loops
2. Execute business logic at one time. Eg. Subtracting 11 from a variable instead of subracting 1 for 11 times
*/
contract class484 {
    uint a = 10;
    
    function func2() public {
        for(uint x =0; x <= 10;x++){
            
            //一堆執行事項
            
            a = a -1;
        }
    }
}