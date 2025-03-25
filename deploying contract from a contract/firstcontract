// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract firstcontract{

    struct user_number{
        uint256 number;
        string user;
    }

    mapping (string=>uint256) public user_to_number;

    user_number[] public user_numbers;

    function adduserandnumber(string memory _user,uint256 _number) public{
        user_numbers.push(user_number(_number,_user));
        user_to_number[_user] =_number;
    }

    function getAll() public view  returns (user_number[] memory){
        return user_numbers;
    }
}
