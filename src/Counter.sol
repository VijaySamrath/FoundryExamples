// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public count;

    constructor (uint256 _count) {
        count = _count;
    }

    function increment() public {
        count++;
    }

    function decrement() public {
        count--;
    }

    function getcount() public view returns(uint256) {
        return count;
    }
}
