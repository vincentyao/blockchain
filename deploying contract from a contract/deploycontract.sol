// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {firstcontract} from "./first contract.sol";

contract deploycontract{

    firstcontract[] public myfirstcontract;

    function createmycontract() public{
        myfirstcontract.push(new firstcontract());
    }

    function sfadduserandnumber(uint256 _indexnumber,string memory _user, uint256 _number)public {
        myfirstcontract[_indexnumber].adduserandnumber(_user,_number);
    }

    function sfgetall(uint256 _indexnumber)public  view returns (firstcontract.user_number[] memory){
        return myfirstcontract[ _indexnumber].getAll();
    }

}
