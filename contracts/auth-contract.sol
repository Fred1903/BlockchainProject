// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Authentication {
    struct User {
        bool exists;
        string username;
        bytes32 passwordHash;
        uint256 lastLogin;
    }
    
    mapping(address => User) public users;
    
    event UserRegistered(address userAddress, string username);
    event UserLoggedIn(address userAddress, uint256 timestamp);
    
    function register(string memory _username, bytes32 _passwordHash) public {
        require(!users[msg.sender].exists, "User already exists");
        users[msg.sender] = User({
            exists: true,
            username: _username,
            passwordHash: _passwordHash,
            lastLogin: 0
        });
        emit UserRegistered(msg.sender, _username);
    }
    
    function login(bytes32 _passwordHash) public returns (bool) {
        require(users[msg.sender].exists, "User does not exist");
        require(users[msg.sender].passwordHash == _passwordHash, "Invalid password");
        users[msg.sender].lastLogin = block.timestamp;
        emit UserLoggedIn(msg.sender, block.timestamp);
        return true;
    }


    function getPasswordHash(string memory password) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(password));
    }

}