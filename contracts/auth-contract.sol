// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAccess {
    // Mapping pour stocker les adresses ayant accès
    mapping(address => bool) public hasAccess;
    
    // Prix d'accès en ETH
    uint256 public constant ACCESS_PRICE = 0; // 0 ETH pour la démo
    
    // Event émis quand quelqu'un obtient l'accès
    event AccessGranted(address indexed user);
    //Quand on lui l'enlève
    event AccessRevoked(address indexed user);
    
    // Fonction pour obtenir l'accès
    function getAccess() public payable {
        //doit etre avant la ligne suivante sinon on aura dépensé déja
        require(!hasAccess[msg.sender], "You already have access");
        require(msg.value >= ACCESS_PRICE, "Wrong amount sent");
        
        hasAccess[msg.sender] = true;//on lui donne l'accès
        emit AccessGranted(msg.sender);//Et on emet l'événemnt
    }
    
    function removeAccess(address user) public {
        require(hasAccess[user], "User does not have access");
        hasAccess[user] = false;
        emit AccessRevoked(user); // Émet un événement pour suivre la suppression
    }

    // Fonction pour vérifier l'accès
    function checkAccess(address user) public view returns (bool) {
        return hasAccess[user];
    }
}