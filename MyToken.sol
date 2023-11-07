// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC721/extensions/ERC721Burnable.sol";

contract MyToken is ERC721, ERC721URIStorage, ERC721Burnable {
    uint256 private _nextTokenId = 1;

    //we can easily convert numbers strings
    using Strings for uint256;

    event MintEvent(string tokenUri, uint _tokenId);

    constructor()
        ERC721("MyToken", "MTK")
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://JulyAnira.github.io/nft-demo/nft-media/metadata/";
    }

    function safeMint(address to) public  {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenId.toString());

        //when we mint thw token, emit an event that tells us
        // the URI and tokenId of our new token
        emit MintEvent(tokenURI(tokenId), tokenId);
    }



    

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}