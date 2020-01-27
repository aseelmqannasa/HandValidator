# HandValidator
main issues that had to be solved are joker and ace in sequential group cases

ace can be used as A,2,3 and as A,K,Q but not as 2,A,K,Q,... 
(this was validated in the SequentialGroup function) to make sure that A is only at index 0 or last index and only followed by a 2 or a K

joker must be validated when at the middle of a group, example:
usually, 2, 3, 4 validated by making sure that they form a series in the ranks array
however, 2, joker, 4: we can not know if the joker replaces the right sequence. 
the solution is to make sure that the card before the joker and the card after are 2 indecies apart in the ranks array
(this was solved in the CheckSequence function)


***run "TestCases.rb" for test cases

***run "UserInput.rb" to input different sets of cards

***"HandValidator.rb" contains all of the functions that were used to solve the task
