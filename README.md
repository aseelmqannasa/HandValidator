# HandValidator
main issues that had to be solved are joker and ace in sequential group cases
ace can be used as A,2,3 and as A,K,Q but not as 2,A,K,Q,... this was validated in the SequentialGroup function to make sure that A is only at index 0 or last index and only followed by a 2 or a K
joker is not an issue when it is at index 0 or last index
but must be validated when at the middle, example:
usually, 2, 3, 4 can be easily validated as a sequential group by making sure that they form a series in the ranks array
however, 2, joker, 4: we can not really know if the joker replaces the right sequence, therefore, the solution is to make sure that the card before the joker and the card after are 2 indecies aparted in the ranks array
this was solved in the CheckSequence function

you can run "TestCases.rb" file to see each test case with its result 
example: 
3h,1j,3c: is a valid same-rank group
2h,3h: is an invalid group; the group must at least contain 3 cards
5h,5c,5d,5s,5c: is an invalid group; the 5c is repeated

you can run "UserInput.rb" file to input different sets of cards

"HandValidator.rb" contains all of the functions that were used to solve the task
