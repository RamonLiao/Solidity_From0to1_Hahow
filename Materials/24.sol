pragma solidity ^0.4.24;
contract class24{
    function get_time_now()public view returns(uint256,uint256){
        return (now,block.timestamp);
    }
    function get_block_info()public view returns(uint blockNumber,bytes32 blockHash,uint256  blockDifficulty){
        //只能拿到256個區塊內的hash
        return (block.number,
                blockhash(block.number-1),
                block.difficulty);
    }
    function get_tx_info()public view returns(address msgSender,address origin,uint value){
        return (msg.sender,
                tx.origin,
                msg.value);
    }

    //實作記錄送過來的ether
    uint public value;
    address public who;
    uint public blockheight;
    uint public rightnow;

    function buy() public payable{
        value = msg.value;
        who = msg.sender;
        blockheight = block.number;
        rightnow = now;
    }
}