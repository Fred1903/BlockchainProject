# Guide d'Implémentation Smart Contract d'Authentification

## 1. Environnement de développement
1. Installation Remix IDE (https://remix.ethereum.org/)
2. Installation MetaMask
3. Configuration réseau Sepolia dans MetaMask

## 2. Création du Smart Contract
1. création du workspace dans Remix
1. Nouveau fichier Authentication.sol dans Remix
2. Implémentation du contrat avec fonctions :
   - register()
   - login()
   - getPasswordHash()

## 3. Déploiement
1. Compilation dans Remix (version ^0.8.0)
2. Connexion MetaMask au réseau Sepolia
3. Ajouter du sepolia (faucet via adresse portefeuille MetaMask)
3. Déploiement via l'interface Remix
4. Récupération de l'adresse du contrat déployé

## 4. Configuration MetaMask
1. Ouverture MetaMask
2. Importation du jeton :
   - Cliquer sur "Jetons"
   - "Importer jeton personnalisé"
   - Coller l'adresse du contrat
   - Ajouter symbole et décimales (18)

## 5. Test des Fonctionnalités
1. Test register() :
   - Entrer username et passwordHash
   - Confirmer transaction MetaMask
2. Test login() :
   - Entrer passwordHash
   - Confirmer transaction MetaMask

## Notes importantes
- Besoin de SepoliaETH pour les transactions
- Confirmation MetaMask nécessaire pour chaque transaction
- Temps d'attente pour confirmations réseau
