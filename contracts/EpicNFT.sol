// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

contract EpicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("TeeJayNFT", "TJ") {
        console.log("My NFT contract!");
    }

    function makeEpicNFT() public {
        // get current `tokenId`
        uint256 newItemId = _tokenIds.current();

        // mint the NFT to the sender
        _safeMint(msg.sender, newItemId);

        // set the NFT data
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/PQUR");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        // Increment the counter
        _tokenIds.increment();
    }
}