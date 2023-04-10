// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Liberary is Ownable {
    using Counters for Counters.Counter;
    Counters.Counter bookIdcounter ;
    

    IERC20 public token;
    uint membership;
    uint duration = 7 days;
    

    //Book[] public bookList;
    struct Book {
        string name;
        uint id;
        bool isavilable;
        address borrower;
        uint borrowTime;
    }
    mapping (uint => Book) public bookList;
    uint[] public bookIds ;

    struct Member {
        string name;
        uint bookId;
        address member;
        uint balance;
    }
    mapping (address => Member) public memberList;

    constructor(address _token){ 
        token = IERC20(_token) ;
        
    }

    function  addBook (string memory _name) public onlyOwner {

        bookIdcounter.increment();
        uint bookId = bookIdcounter.current();
        
        bookList[bookId] = Book ( {
         name : _name,
         id : bookId,
         isavilable : true,
         borrower : address(0),
         borrowTime : 0
        } ) ;

        bookIds.push(bookId);
        
    }

}