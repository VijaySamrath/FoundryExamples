//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/ERC721.sol";

contract ERC721Test is Test {
    ERC721 public erc721;

    address rahul = address(0x1);
    address priya = address(0x2);

    function testMintToken() public {
        erc721 = new ERC721();
        erc721.mint(rahul, 1);
        address owner_of = erc721.ownerOf(1);
        assertEq(rahul, owner_of);
    }

    function testransferToken() public {
        erc721 = new ERC721();
        erc721.mint(rahul, 1);

        vm.startPrank(rahul);
        erc721.transferFrom(rahul, priya, 1);

        address owner_of = erc721.ownerOf(1);
        assertEq(priya, owner_of);

    }
    
    function testGetBalance() public {
        erc721 = new ERC721();
        erc721.mint(rahul, 0);
        erc721.mint(rahul, 1);

        erc721.mint(rahul, 2);
        erc721.mint(rahul, 3);
        erc721.mint(rahul, 4);

        uint balance = erc721.balanceOf(rahul);
        assertEq(balance, 5);
        
    }

    function testOnlyOwnerBurn() public {
        erc721 = new ERC721();
        erc721.mint(rahul, 0);
        
        vm.startPrank(priya);
        vm.expectRevert( "not owner");
        erc721.burn(0);
    }

}
