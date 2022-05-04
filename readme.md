# Parameterized Synchronous FIFO 
## Shahbaz Hassan Khan Malik

This is a parameterizd synchronous FIFO (First-In-First-Out) design.

It has the following characterstics:
1. Same clock for read and write is used
2. Flags: empty, full, almost empty, almost full, overflow, underflow.
3. Almost flags are based on the parameter, for example: 2, in this case
4. Valid signal is provided on successful read 

<img width="679" alt="Screen Shot 2022-05-04 at 1 16 09 PM" src="https://user-images.githubusercontent.com/98668171/166818659-60701f12-8a73-41ff-bb94-f954245b8880.png">

