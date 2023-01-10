pragma solidity ^0.4.24;

contract class44_game{

    event win(address);

    // 1. Miners could fake the blockchain address, and coinbase would be different.
    // 2. Using global variables could be examined in advance by speculators and then they decide to play or not.
    function get_random() public view returns(uint){
        bytes32 ramdon = keccak256(abi.encodePacked(now,blockhash(block.number-1)));
        // bytes32 ramdon = keccak256(abi.encodePacked(now,blockhash(block.number-1),block.coinbase, block.difficulty));

        return uint(ramdon) % 1000;
    }

    function play() public payable {
        require(msg.value == 0.001 ether);
        if(get_random()>=500){
            msg.sender.transfer(0.002 ether);
            emit win(msg.sender);
        }
    }

    function () public payable{
        require(msg.value == 0.01 ether);
    }
    
    constructor () public payable{
        require(msg.value == 0.01 ether);
    }
}