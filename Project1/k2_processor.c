#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "decoder.h"
#include "jump.h"
#include "mux.h"
#include "fetch.h"
#include "program_counter.h"
#include "loading.h"
#include "ALU.h"
#include "assembler.h"

int main() {
    uint8_t RA = 0, RB = 0, RO = 0;
    uint8_t result = 0;
    uint8_t PC = 0, D1D0 = 0, S = 0, J = 0, immediate = 0, Sreg = 0, jc = 0;
    uint8_t memory[9] = {0};
    assembler(memory);
    uint8_t instruction = 0;
    bool RAen = false;
    bool RBen = false;
    bool ROen = false;
    bool carry_out = false;
    uint8_t count = 0;

    while (PC < 9 && count != 130) {
        instruction = fetch_instruction(memory, PC);
        loading(&instruction, &D1D0, &S, &J, &immediate, &Sreg, &jc);
        decoder(D1D0, &RAen, &RBen, &ROen);

        if (jump(J, &PC, immediate, &jc, &carry_out)) {
            continue;
        }

        if (RAen) {
	  ALU(RA, RB, S, &carry_out, &jc, &instruction, &result);
	  RA = mux(Sreg, RA, immediate ,&result);
	         
        } else if (RBen) {
	  ALU(RA, RB, S, &carry_out, &jc, &instruction, &result);
	  RB = mux(Sreg, RB, immediate, &result);
	   
        } else if (ROen) {
            RO = RA;
        }

        printf("PC: %u, RA: %d, RB: %d, RO: %d, Carry Out: %d\n", PC, RA, RB, RO, carry_out);

        program_counter(&PC);
        count++;
    }

    return 0;
}
