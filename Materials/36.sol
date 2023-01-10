pragma solidity ^0.4.24;

contract class36{

    uint public b;
    constructor() public{
        b=1;
    }

    uint public a = 1;

    // only be called by external transactions or from other contract
    function external_example(uint x) external {
        a=x;
    }
    
    // only be called within the contract and the heirited contract
    function internal_example(uint x) internal {
        a=x;
    }
    
    // no restriction, can be called by external transactions, from other contract, and the heirited contract
    function public_example(uint x) public {
        a=x;
        // internal_example(4);  // compilable
        // external_example(5);  // not compilable and can't be called within the contract
        
        private_example2(x); // -> encapsulation
    }
    
    // only be called within the contract
    function private_example(uint x) private {
        a=x;

        private_example2(x); // -> encapsulation
    }

    function private_example2(uint x) private {
        a=x;
    }
}

contract class36_2 is class36{

    uint public b;

    constructor() public{
        b=2; // this will overwrite the value of the parental b;
    }

    function call_internal2(uint x)public{
        internal_example(x);
    }
    // //can't call private
    // function call_private2(uint x)public{
    //     private_example(x);
    // }
}