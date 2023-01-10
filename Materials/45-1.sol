pragma solidity ^0.4.24;

/*
This smart contract demostrates gas issues due to FOR loops. 
If more investers invest, the number of loops also increases. Then the transferring gas would also increase. 
This problem could result in transaction gas increased over the block limit.
Eventually, the whole transaction would fail, no one can retrieve the invested tokens.
*/

contract DistributeTokens {
    address public owner; 
    address[] investors; 
    uint[] investorTokens; 

    constructor() public {
        owner = msg.sender;
    }

    //投資
    function invest() public payable {
        investors.push(msg.sender);  //push 就是把東西加進去陣列裡面
        investorTokens.push(msg.value / 100); 
    }

    //分配獎金
    function distribute() public {
        require(msg.sender == owner); // only owner
        
        //限制只能每天領一次！
        
        for(uint i = 0; i < investors.length; i++) { 
            investors[i].transfer(investorTokens[i]);
        }
    }
}