// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Lottery {
    address public manager;
    address payable[] public participants;
     
    constructor (){
        manager = msg.sender; // This is the owner of the Contract
    }

    receive() external payable
    {
        require(msg.value == 2 ether , "Only 2 Ether is required to Participate!");
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint)
    {
        require(msg.sender == manager , "Only Manager is allow to check the Balance!");
        return address(this).balance;
    }

    function randomUser() public view returns(uint)
    {
        // This project is for practice not for Main net 
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp , participants.length ))); // Create random nuumber to selct the winner candidate

    }
}
