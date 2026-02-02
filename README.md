# UART Transmitter & Receiver in Verilog HDL
## Overview

This project implements a Universal Asynchronous Receiver Transmitter (UART) using Verilog HDL.
The design includes a baud rate generator, UART transmitter (TX), UART receiver (RX), and testbenches for functional verification.

The UART RX is designed using oversampling (16× baud rate) and mid-bit sampling, making it robust against clock mismatch and noise.

 ## Features

Configurable baud rate (default: 9600)

Supports 8-bit data, 1 start bit, 1 stop bit, no parity

Separate TX and RX baud enable signals

16× oversampling for reliable RX

FSM-based TX and RX logic

Fully verified using testbenches

Synthesizable RTL (no simulation-only constructs)

## Design Architecture
1️⃣ Baud Rate Generator

Generates:

enb_tx: 1× baud enable for transmitter

enb_rx: 16× baud enable for receiver

Based on system clock frequency (100 MHz)

2️⃣ UART Transmitter (TX)

FSM states:

IDLE

START

DATA

STOP

Transmits data LSB first

busy signal indicates active transmission

3️⃣ UART Receiver (RX)

FSM-based design

Uses 16× oversampling

Samples data at the center of each bit

Asserts rx_valid when a byte is successfully received
