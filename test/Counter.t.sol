// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter(10);
    }

    function testIncrement() public {
        counter.increment();
        uint value = counter.getcount();
        assertEq(counter.count(), 11);
        emit log_named_uint("The count is:", value);
    }

    function testdecrement() public {
        counter.decrement();
        uint value = counter.getcount();
        assertEq(counter.count(), 9);
        emit log_named_uint("The count is:", value);
    }
}
