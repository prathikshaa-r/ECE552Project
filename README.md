# ECE 552 - Adv Comp Arch Project
## Base
This project builds upon a single issue processor with static branch prediction written for MIPS like assembly code.

## Aim
This project aims to extend the single-issue processor to a dual-issue processor with dynamic branch prediction.

## Status
- Implemented dual-issue superscalar processor.
- Implemented dynamic branch prediction for single-issue processor.

## Design
### Branch Predictor
The branch prediction scheme used is a two-level branch prediction with a Global Branch History Register using a Branch Target Buffer to check if the given PC is a branch and what its target address may be. A two-bit saturating counter is used to make the prediction.

### Benchmarks
MIPS Assembly Benchmarks were written to analyse the performance tradeoffs of the given design.
