pragma solidity ^0.4.24;
contract class25{    
    mapping(address=>uint) public balances;
    
    uint public abc = 0;

    // 無名方法 (fallback): 只要呼叫此合約，就會執行
    // function () public{
    //     //不能對此合約發送以太
    //     abc++;
    // }
    function () public payable{
        //可以對此合約發送以太
    }
    
    function sendEther()public payable{
        balances[msg.sender] += msg.value;
    }

    function sendEtherNoPayable()public{
        balances[msg.sender] += msg.value;
    }

    // function returntest() public view returns(address){
    //     return msg.sender;
    // }

    function returntest() public returns(address){

        abc = runandrun();

        return msg.sender;
    }

    function runandrun() public returns(uint){
        uint a = 0;
        uint b = 5;
        
        return a + b + abc;
    }
    //無名方法
    //payable
    //兩種方法return
}