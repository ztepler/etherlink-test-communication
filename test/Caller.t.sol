// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {Caller} from "../src/Caller.sol";

contract CounterTest is Test {
    Counter public counter;
    Caller public caller;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
        caller = new Caller();
    }

    function test_IncrementCall() public {
        caller.increment(address(counter));
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumberCall(uint256 x) public {
        caller.setNumber(address(counter), x);
        assertEq(counter.number(), x);
    }
}
