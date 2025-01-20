// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/StakingContract.sol";

contract TestContract is Test {
    StakingContract stakingcontract;
    address user = address(0x123);

    function setUp() public {
        stakingcontract = new StakingContract();
        vm.deal(user, 10 ether);
    }

    function testStake() public {
        vm.startPrank(user);
        stakingcontract.stake{value: 1 ether}(1 ether);
        assertEq(
            stakingcontract.getStakedBalance(),
            1 ether,
            "Staked balance should be 1 ether"
        );
        vm.stopPrank();
    }

    function testUnStake() public {
        vm.startPrank(user);
        stakingcontract.stake{value: 5 ether}(5 ether);
        assertEq(
            stakingcontract.getStakedBalance(),
            5 ether,
            "Staked balance should be 5 ether"
        );
        stakingcontract.unStake(2 ether);
        assertEq(
            stakingcontract.getStakedBalance(),
            3 ether,
            "Staked balance should be 3"
        );
        vm.stopPrank();
    }
}
