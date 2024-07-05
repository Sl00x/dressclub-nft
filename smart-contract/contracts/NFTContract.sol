// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFTContract is ERC721 {
    using Strings for uint256;

    // Optional: base URI for retrieving token metadata
    string private _baseTokenURI;
    address private _owner;

    // Mapping from token ID to token URI
    mapping (uint256 => string) private _tokenURIs;

    constructor(string memory name_, string memory symbol_, string memory baseTokenURI_) ERC721(name_, symbol_) {
        _baseTokenURI = baseTokenURI_;
        _owner = msg.sender;
    }

    /**
     * @dev Returns the base URI set via {_setBaseURI}. This will be
     * automatically added as a prefix in {tokenURI} to each token's URI, or
     * to the token's URI if no specific URI is set for that token ID.
     */
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    /**
     * @dev Sets `baseURI` to the specified value.
     * @param baseURI_ The base URI to be set.
     */
    function setBaseURI(string memory baseURI_) public {
        require(msg.sender == _owner, "Not owner of this contract");
        _baseTokenURI = baseURI_;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        // If there is no tokenURI set, concatenate baseURI and tokenID
        if (bytes(_tokenURI).length == 0) {
            return bytes(base).length > 0
                ? string(abi.encodePacked(base, tokenId.toString()))
                : '';
        }

        // If there is a tokenURI, concatenate baseURI and tokenURI
        return bytes(base).length > 0
            ? string(abi.encodePacked(base, _tokenURI))
            : _tokenURI;
    }

    /**
     * @dev Mints a new NFT.
     * @param tokenId The token id to mint.
     * @param tokenURI_ The token URI for the NFT metadata.
     */
    function mintNFT(uint256 tokenId, string memory tokenURI_) public  {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI_);
    }

    /**
     * @dev Internal function to set the token URI for a given token.
     * Reverts if the token ID does not exist.
     * @param tokenId The token ID to set its URI.
     * @param tokenURI_ The token URI to assign.
     */
    function _setTokenURI(uint256 tokenId, string memory tokenURI_) internal virtual {
        _tokenURIs[tokenId] = tokenURI_;
    }

    
}
