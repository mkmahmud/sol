// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Function {
    int public normalNum;

    function incrementNum () public {
        normalNum +=1;
    }
}