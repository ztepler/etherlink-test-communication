// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {Counter} from "./Counter.sol";

contract Caller {
    function setNumber(address counter, uint256 newNumber) public {
        Counter counterContract = Counter(counter);
        counterContract.setNumber(newNumber);
    }

    function increment(address counter) public {
        Counter counterContract = Counter(counter);
        counterContract.increment();
    }
}

