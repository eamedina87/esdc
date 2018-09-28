/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include "xparameters.h"
#include "xgpio.h"
#include "xuartps.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//====================================================

const int HEX_LENGTH = 5;
const int FIVE_LETTERS_MAX = 1048575;
const int SIX_LETTERS_MAX = 16777215;

int main (void)
{
//Pointer	and	variable	declaration
	XGpio dip,	push,	leds;
	int i,	psb_status,	sw_code;
	int gameMode, randomNumber, playerNumber, cont=0;
	char code[5] = {'0','0','0','0','0'};
	xil_printf("-- Start	of	the	Program	--\r\n");
	//	Pointer	initialization
	//	Check	out	your	own	XPAR	ID	symbol	name	declared	in	xparameters.h
	//	The	format	is	always	XPAR_<NAME_IN_VIVADO>_DEVICE_ID
	XGpio_Initialize(&dip,	XPAR_SWITCHES_DEVICE_ID);
	XGpio_SetDataDirection(&dip,	1,	0xffffffff);
	XGpio_Initialize(&push,	XPAR_BUTTONS_DEVICE_ID);
	XGpio_SetDataDirection(&push,	1,	0xffffffff);
	XGpio_Initialize(&leds,	XPAR_LEDS_DEVICE_ID);
	XGpio_SetDataDirection(&leds,	1,	0x00000000);
	//Read	the	initial	buttons	status
	//psb_status	=	XGpio_DiscreteRead(&push,	1);
	//xil_printf("Initial	Push	Buttons	Status	(should	be	0)	%x\r\n",	psb_status);
	//runGame(&dip, &push, &leds);

	char hexChain[HEX_LENGTH+1];
	int player1Result;
	int player2Result;
	int mButtonStatus;
	/** CHOOSE PLAY MODE **/
	xil_printf("Please choose your play mode: 1(MEMORY) 2(TIME):");
	do{
		mButtonStatus = XGpio_DiscreteRead(&push,1);
		if(mButtonStatus>0){
			gameMode = XGpio_DiscreteRead(&dip,	1);
		}
	} while (gameMode!=1 && gameMode!=2);
	xil_printf("%d\n", gameMode);
	for (i=0;	i<9999999;	i++);
	/** CHOOSE PLAYERS **/
	xil_printf("Please choose number of players: 1(ONE) 2(TWO):");
	do{
		mButtonStatus = XGpio_DiscreteRead(&push,1);
		if(mButtonStatus>0){
			playerNumber = XGpio_DiscreteRead(&dip,	1);
		}
	} while (playerNumber!=1 && playerNumber!=2);
	xil_printf("%d\n", playerNumber);
	for (i=0;	i<9999999;	i++);
	/** GENERATE RANDOM HEX NUMBER **/
	randomNumber = generateRandomNumber();
	sprintf(hexChain, "%04X", randomNumber);
	printf("Char: %s\n", hexChain);
	for (i=0;	i<(9999999*9999999);	i++);
	/** PLAYER 1 GAMEPLAY **/
	if (gameMode==1){
		printLines(50);
	}
	printf("**********Your turn Player 1**********\n");
	int charCount = 0;
	int numChars[HEX_LENGTH];
	char chars[HEX_LENGTH];
	char result[HEX_LENGTH+1];
	int input = -1;
	while (charCount<HEX_LENGTH){
		xil_printf("Write character at position %i: ", charCount+1);
		//int input = getIntInput(dip, push);
		do{
			mButtonStatus = XGpio_DiscreteRead(&push,1);
			//if(mButtonStatus>0){
			input = XGpio_DiscreteRead(&dip,	1);
			//}
		} while (input = -1);
		numChars[charCount] = input;
		xil_printf("input: %d", input);
		charCount++;
		for (i=0;	i<9999999999;	i++);
	}
	sprintf(result,"%X%X%X%X%X", numChars[0], numChars[1], numChars[2], numChars[3], numChars[4]);
	printf("input char: %s", result);
	//return (int)strtol(result, NULL, 16);

	/*player1Result = getPlayerResult(gameMode, 1, &dip, &push);
	if (playerNumber==2)
		player2Result = getPlayerResult(gameMode, 2, &dip, &push);

	compareResultForPlayer(randomNumber, player1Result, 1, &leds);
	if (playerNumber==2)
		compareResultForPlayer(randomNumber, player2Result, 2, &leds);
	 */
}



int generateRandomNumber(){
    int mRand;
    mRand = rand() % (FIVE_LETTERS_MAX + 1);
    return mRand;
}

printLines(int value){
	printf("\n");
	int cont = 0;
    while (cont<value){
        printf("**************************************\n");
    	cont++;
    }
}


/*
int getPlayerResult(int gameMode, int playerNumber, XGpio dip, XGpio push){
    switch (gameMode){
        case 1: return getMemoryResultForPlayer(playerNumber, &dip, &push);
        default: return getTimeResultForPlayer(playerNumber, &dip, &push);
    }
}

int getMemoryResultForPlayer(int playerNumber, XGpio dip, XGpio push){
    waitSeconds(5);
    if (playerNumber==1){
        //printLines(50);
    	int i = 0;
		while (i<50){
			printf("**************************************\n");
			i++;
		}

    }
    printf("**********Your turn Player %i**********\n", playerNumber);
    int charCount = 0;
    int numChars[HEX_LENGTH];
    char chars[HEX_LENGTH];
    char result[HEX_LENGTH+1];
    while (charCount<HEX_LENGTH){
        printf("Write character at position %i: ", charCount+1);
        int input = getIntInput(dip, push);
        numChars[charCount] = input;
        charCount++;
    }
    sprintf(result,"%X%X%X%X%X", numChars[0], numChars[1], numChars[2], numChars[3], numChars[4]);
    //printf("input: %s", result);
    return (int)strtol(result, NULL, 16);
}

int getTimeResultForPlayer(int playerNumber, XGpio dip, XGpio push){
    printf("**********Your turn Player %i**********\n", playerNumber);
    int charCount = 0;
    int numChars[HEX_LENGTH];
    char chars[HEX_LENGTH];
    char result[HEX_LENGTH+1];
    while (charCount<HEX_LENGTH){
        printf("Write character at position %i: ", charCount+1);
        int input = getIntInput(dip, push);
        numChars[charCount] = input;
        charCount++;
    }
    sprintf(result,"%X%X%X%X%X", numChars[0], numChars[1], numChars[2], numChars[3], numChars[4]);
    //printf("input: %s", result);
    return (int)strtol(result, NULL, 16);
}

compareResultForPlayer(int expectedResult, int obtainedResult, int playerNumber){
    char message;
    if (expectedResult==obtainedResult){
        printf("Congratulations Player %d, you guessed it!\n", playerNumber);
    } else {
        printf("You weren't lucky Player %d. Expected: %04X. Input: %04X."
                " You can try again!\n", playerNumber, expectedResult, obtainedResult);
    }
}

waitSeconds(int value){
    time_t start = time(NULL);
    while (time(NULL) - start < value) {

    }
}*/




