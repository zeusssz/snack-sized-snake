# Snake Game in x86 Assembly (Under 100 Bytes)

This is a minimal implementation of a Snake game written in x86 assembly for DOS, targeting a size constraint of under 100 bytes. The game logic includes basic snake movement, _very_ simple collision handling, and snake growth upon eating food.

## Building the Game

1. **Requirements:**
   - NASM assembler: Install from [nasm.us](https://www.nasm.us/)
   - DOS emulator (e.g., [DOSBox](https://www.dosbox.com/)) or a virtual machine running DOS/FreeDOS

2. **Assemble the Code:**

   Save the assembly code in `snake.asm`:

   Assemble it with NASM:
   ```sh
   nasm -f bin -o snake.com snake.asm
   ```

   This will generate a DOS-compatible executable `snake.com`.

## Running the Game

- **DOSBox**:
  - Open DOSBox and navigate to the directory containing `snake.com`.
  - Run the game with:
    ```sh
    snake.com
    ```

- **FreeDOS or Virtual Machine**:
  - Copy `snake.com` to the DOS environment.
  - Execute from the command line.

## Game Controls

- Press any key to start the game.
- pray

## Notes

- This code directly manipulates the video memory (`0xB800`) for text mode in DOS, which may not be portable to non-DOS environments.
- The implementation is highly constrained by the 100-byte size limit, so many standard game features are not included.
- The snake’s movement and growth are handled by manipulating characters directly in memory, without advanced collision detection or dynamic food placement.
