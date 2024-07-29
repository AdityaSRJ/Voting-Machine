# Voting Machine Design

The following project implements a simple voting machine for contesting an election among **four candidates**. The Voting Machine implemented has **2 modes:**

1) Mode 1: Vote Registering Mode.
2) Mode 2: Vote Tallying Mode.

## Modules

### 1) Button Control
**Input Signals:** 
* clock
* reset
* button

**Output Signals:**
* valid_vote

This particular module **tells the system if a particular vote is valid or not.**
For a vote to be valid, the button has to be pressed long enough, with 10 clock cycles, to be precise. The valid pulse is thus generated at the 11th pulse.

### 2) Vote Logger:

**Input Signals:**

* clk
* reset
* mode
* cand1_vote_valid
* cand2_vote_valid
* cand3_vote_valid
* cand4_vote_valid

**Output Signals:**

* cand1_vote_recvd
* cand2_vote_recvd
* cand3_vote_recvd
* cand4_vote_recvd

This particular module **is used to store the registered votes.** The votes are stored in a counter. This counter counts up if it sees a valid_vote pulse and the machine is in voting mode, i.e. mode = 0.

### 3) Mode Control

**Input Signals:**

* clk
* reset
* mode
* valid_vote_casted
* candidate1_vote
* candidate2_vote
* candidate3_vote
* candidate4_vote
* candidate1_button_press
* candidate2_button_press
* candidate3_button_press
* candidate4_button_press

**Output Signals:**

* leds

This particular module, **depending on the mode, lights up the LEDs.**

If the machine is in **vote registering mode**, it simply **lights up all the LEDs** for 10 clock cycles after it sees a valid pulse **to indicate that the vote has been registered.**

If the machine is in **vote tallying mode**, then depending on the button pressed, the **LEDs light up in a binary sequence**, displaying the **total votes registered** for that particular candidate.

### 4) Voting Machine

This is the Top Design Module

