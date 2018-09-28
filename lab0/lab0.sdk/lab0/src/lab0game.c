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

int seed=0;

int main (void)
{
//Pointer	and	variable	declaration
	XGpio dip,	push,	leds;

	//	Pointer	initialization
	//	Check	out	your	own	XPAR	ID	symbol	name	declared	in	xparameters.h
	//	The	format	is	always	XPAR_<NAME_IN_VIVADO>_DEVICE_ID
	XGpio_Initialize(&dip,	XPAR_SWITCHES_DEVICE_ID);
	XGpio_SetDataDirection(&dip,	1,	0xffffffff);
	XGpio_Initialize(&push,	XPAR_BUTTONS_DEVICE_ID);
	XGpio_SetDataDirection(&push,	1,	0xffffffff);
	XGpio_Initialize(&leds,	XPAR_LEDS_DEVICE_ID);
	XGpio_SetDataDirection(&leds,	1,	0x00000000);

	/** CHOOSE PLAY MODE **/
	/*xil_printf("Please choose your play mode: 1(MEMORY) 2(TIME):");
	do{
		mButtonStatus = XGpio_DiscreteRead(&push,1);
		if(mButtonStatus>0){
			gameMode = XGpio_DiscreteRead(&dip,	1);
		}
	} while (gameMode!=1 && gameMode!=2);
	xil_printf("%d\n", gameMode);
	for (i=0;	i<9999999;	i++);*/

	while (1){
		int gameMode=1, randomNumber, playerNumber, i;
		int charCount = 0;
		int numChars[HEX_LENGTH];
		char resultP1[HEX_LENGTH+1];
		char resultP2[HEX_LENGTH+1];
		int input;
		char hexChain[HEX_LENGTH+1];
		int mButtonStatus;

		xil_printf("***********************************************\n");
		xil_printf("******************MEMORY GAME******************\n");
		xil_printf("***********************************************\n");

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
		xil_printf("Char: %s\n", hexChain);
		for (i=0;	i<(9999999*9999999);	i++);
		/** PLAYER 1 GAMEPLAY **/
		if (gameMode==1){
			printLines(50);
		}
		xil_printf("***************Your turn Player 1**************\n");
		while (charCount<HEX_LENGTH){
			xil_printf("Write character at position %d: ", charCount+1);
			do{
				mButtonStatus = XGpio_DiscreteRead(&push,1);
				input = XGpio_DiscreteRead(&dip,	1);
			} while (mButtonStatus == 0);
			numChars[charCount] = input;
			xil_printf("%X\n", input);
			charCount++;
			for (i=0;	i<99999999;	i++);
		}
		sprintf(resultP1,"%X%X%X%X%X", numChars[0], numChars[1], numChars[2], numChars[3], numChars[4]);
		/** PLAYER 2 GAMEPLAY **/
		if (playerNumber==2){
			charCount = 0;
			xil_printf("***************Your turn Player 2**************\n");
				while (charCount<HEX_LENGTH){
					xil_printf("Write character at position %d: ", charCount+1);
					//int input = getIntInput(dip, push);
					do{
						mButtonStatus = XGpio_DiscreteRead(&push,1);
						//if(mButtonStatus>0){
						input = XGpio_DiscreteRead(&dip,	1);
						//}
					} while (mButtonStatus == 0);
					numChars[charCount] = input;
					xil_printf("%X\n", input);
					charCount++;
					for (i=0;	i<99999999;	i++);
				}
				sprintf(resultP2,"%X%X%X%X%X", numChars[0], numChars[1], numChars[2], numChars[3], numChars[4]);
		}

		/** PLAYER 1 RESULT **/
		if (hexChain==resultP1){
			xil_printf("Congratulations Player 1, you guessed it!\n");
		} else {
			xil_printf("You weren't lucky Player 1. Expected: %s. Input: %s."
							" You can try again!\n", hexChain, resultP1);
		}

		/** PLAYER 2 RESULT **/
		if (playerNumber==2){
			if (hexChain==resultP2){
				xil_printf("Congratulations Player 2, you guessed it!\n");
			} else {
				xil_printf("You weren't lucky Player 2. Expected: %s. Input: %s."
								" You can try again!\n", hexChain, resultP2);
			}
		}

		xil_printf("*********************************************\n");
		xil_printf("******************GAME OVER******************\n");
		xil_printf("*********************************************\n");

		xil_printf("\n\n\n Push a button to start over\n\n\n");

		do{
			mButtonStatus = XGpio_DiscreteRead(&push,1);
		} while (mButtonStatus == 0);

	}
}

int generateRandomNumber(){
    int mRand;
    seed++;
    srand(seed);
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
