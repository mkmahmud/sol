// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract dataTypesInSol {
    int public  a = type(int).min; 

    // Byte is more gas efficiency

    bytes1 public aa;

    bytes1 public bb = 0x87;

    address public hey;
    

}