// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakingContract {
    mapping(address => uint256) balance;

    constructor() {}

    function stake(uint256 _amount) public payable {
        require(msg.value == _amount, "Amount must be equal to value sent");
        balance[msg.sender] += _amount;
    }

    function unStake(uint _amount) public {
        uint256 stakedAmount = balance[msg.sender];
        require(stakedAmount >= _amount, "You have no staked amount");
        payable(msg.sender).transfer(_amount / 2);
        balance[msg.sender] -= _amount;
    }

    function getStakedBalance() public view returns (uint256) {
        return balance[msg.sender];
    }
}
