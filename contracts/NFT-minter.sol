// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract NFTMinter is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract.");
  }

  function NFTMint() public {
    uint256 newItemId = _tokenIds.current();
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/YH8N");
    console.log("An NFT with ID %s has been minted to %s", newItemId, msg.sender);
    _tokenIds.increment();
  }
}