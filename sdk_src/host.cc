/*
 * Program:

 *   This program is a C++ driver for using one DMA in ZCU102 board.
 *
 * History:
 *   2020/5/14     Yuanlong Xiao   First Release
*/
#include "dma_driver.h"
#include "typedefs.h"

int main(void)
{
	int Status;

	dma_inst dma1(DMA_DEV_ID,
			 RX_BD_SPACE_HIGH,
			 RX_BD_SPACE_BASE,
			 MAX_PKT_LEN,
			 MAX_PKT_LEN_RX,
			 TX_BD_SPACE_HIGH,
			 TX_BD_SPACE_BASE,
			 NUMBER_OF_PACKETS,
			 NUMBER_OF_PACKETS_RX,
			 RX_BUFFER_BASE,
			 TX_BUFFER_BASE);

	Status = dma1.dma_init();
	if (Status != XST_SUCCESS) {
		xil_printf("Device Initiation Failed!\r\n");
		return XST_FAILURE;
	}

	Status = dma1.RecvPackets();
		if (Status != XST_SUCCESS) {
			xil_printf("Receiving Packets Failed!\r\n");
			return XST_FAILURE;
	}

	Status = dma1.WR2TxBuffer();
	if (Status != XST_SUCCESS) {
		xil_printf("Write Buffer Failed!\r\n");
		return XST_FAILURE;
	}

	Status = dma1.SendPackets();
	if (Status != XST_SUCCESS) {
		xil_printf("Sending Packets Failed!\r\n");
		return XST_FAILURE;
	}

	Status = dma1.CleanTxBuffer();
	if (Status != XST_SUCCESS) {
		xil_printf("Cleaning TxBuffer Failed!\r\n");
		return XST_FAILURE;
	}

	Status = dma1.RecvWait();
	if (Status != XST_SUCCESS) {
		xil_printf("Receiving Waits Failed!\r\n");
		return XST_FAILURE;
	}

	Status = dma1.CheckData();
	if (Status != XST_SUCCESS) {
		xil_printf("Checking Data Failed!\r\n");
		return XST_FAILURE;
	}

	Status = dma1.print_results();
	if (Status != XST_SUCCESS) {
		xil_printf("Printing results Failed!\r\n");
		return XST_FAILURE;
	}

	Status = dma1.CleanRxBuffer();
	if (Status != XST_SUCCESS) {
		xil_printf("Cleaning RxBuffer Failed!\r\n");
		return XST_FAILURE;
	}

	xil_printf("Digit Recognition is completed\n\r");
	return XST_SUCCESS;
}


