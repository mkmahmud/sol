// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExpenseTracker {
    struct Expense {
        uint256 amount;
        string description;
        string category;
        uint256 timestamp;
    }

    Expense[] private expenses;
    address public owner;
    uint256 public totalExpenses;

    event ExpenseAdded(uint256 amount, string description, string category, uint256 timestamp);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addExpense(uint256 _amount, string memory _description, string memory _category) public onlyOwner {
        require(_amount > 0, "Expense amount must be greater than zero.");

        expenses.push(Expense(_amount, _description, _category, block.timestamp));
        totalExpenses += _amount;

        emit ExpenseAdded(_amount, _description, _category, block.timestamp);
    }

    function getExpense(uint256 index) public view returns (uint256, string memory, string memory, uint256) {
        require(index < expenses.length, "Expense does not exist.");
        Expense storage expense = expenses[index];
        return (expense.amount, expense.description, expense.category, expense.timestamp);
    }

    function getAllExpenses() public view returns (Expense[] memory) {
        return expenses;
    }

    function getTotalExpenses() public view returns (uint256) {
        return totalExpenses;
    }
}
