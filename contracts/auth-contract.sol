// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAccess {
    // Mapping pour stocker les adresses ayant accès
    mapping(address => bool) public hasAccess;
    
    // Prix d'accès en ETH
    uint256 public constant ACCESS_PRICE = 0; // 0 ETH pour la démo
    
    // Event émis quand quelqu'un obtient l'accès
    event AccessGranted(address indexed user);
    
    // Fonction pour obtenir l'accès
    function getAccess() public payable {
        require(msg.value >= ACCESS_PRICE, "Wrong amount sent");
        require(!hasAccess[msg.sender], "You already have access");
        
        hasAccess[msg.sender] = true;
        emit AccessGranted(msg.sender);
    }
    
    // Fonction pour vérifier l'accès
    function checkAccess(address user) public view returns (bool) {
        return hasAccess[user];
    }
}