// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Lottery {
    address public manager;
    address payable[] public participants;
     
    constructor (){
        manager = msg.sender; // This is the owner of the Contract
    }

    receive() external payable{
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}
