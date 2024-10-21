# Image Processor System Using Altera Cyclone IV DE2-115 Board and LTM Touch Screen

This project demonstrates an image processing system that reads JPG images from the SD card slot on the DE2-115 FPGA board and displays them on the TRDB_LTM touch screen. Users can interact with the touch screen to choose images for viewing, apply gray scale and edge detection filters, and navigate through images.

![Screenshot 2024-10-21 180156](https://github.com/user-attachments/assets/b9d8d831-90f4-4b28-ab60-12614981d2ef)

## Project Overview

- **Board**: Altera Cyclone IV DE2-115 FPGA
- **Display**: TRDB_LTM touch screen
- **Functionality**:  
  - Read JPG images from an SD card.  
  - Display images on the touch screen.  
  - User interaction through the touch screen to select images and apply filters.
  - Supports grayscale and edge detection filters.
- **Hardware IPs**:   
  - **SD Card Controller**: Initializes and read through the SD Card. 
  - **SDRAM**: Memory storage for the project.
  - **Touch Panel Interface**: Controls the AD converter used to obtain the x/y coordinates of the touch point.
  - **PLL**: Generate various clock speeds using the 50 MHz clock input.
  - **LCD Config**: LCD screen driver.
  - **Video Pipeline**: stores the image frame data.
  - **JTAG**: Programms the FPGA, loads binary code into the softcore Nios II, and provides terminal for debugging.
  - **Nios II:** the softcore used to run the C code to control hardware components.
  ![Block Diagram](https://drive.google.com/file/d/1wwOeUEy8g3O9797cDiqGVX8xdTCsWVWP/view?usp=sharing)


## Required Hardware

- Altera Cyclone IV DE2-115 FPGA board.
- TRDB_LTM Touch Screen Kit.
- 40-pin IDE cable (for touch screen connection).
- SD card (formatted to FAT16).

## Software Used

- **Quartus II** **13.0sp1** for FPGA design and bitstream generation.
- **Eclipse IDE** for Nios II software development.

## Getting Started

### Step 1: Hardware Setup

1. **Connect the Touch Screen**:  
   - Use the 40-pin IDE cable to connect the TRDB_LTM touch screen to the DE2-115 board.  
   ![Connection](https://drive.google.com/file/d/15-KWMSGB7QXruJ4l1eid0EK7rqD-ANo_/view?usp=sharing)
   - Plug one end of the cable into the touch screen and the other into the expansion port on the DE2-115 board, as shown in the image below.
   ![Connection to board](https://drive.google.com/file/d/18oEvsJ_fILFfCKRW0ZBfLEadiW4iV36r/view?usp=sharing)
 

2. **Prepare the SD Card**:
   - Format your SD card to **FAT16**.
   - Create a directory named `/jpg` on the SD card.
   - Place at least **3 JPG images** into the `/jpg` directory.  
     For optimal results, use images with a resolution of **800x480** or multiples of that.

3. **Insert the SD Card**:  
   - Insert the SD card into the **SD socket** on the DE2-115 board.

### Step 2: Programming the FPGA

1. **Connect the DE2-115 Board**:  
   - Connect the FPGA board to your computer using a USB cable.

2. **Load the Bitstream**:  
   - Open **Quartus II** and load the provided bitstream file (`DE2_115_LTM_Pic.sof`).  
   ![Programming the FPGA](https://drive.google.com/file/d/1dSyN3v4RArENFRVnidUnIeC9AdV7GMdd/view?usp=sharing)

### Step 3: Running the Software

1. **Open Eclipse IDE**:  
   - Launch **Eclipse IDE** and import the project.
   - Navigate to the software directory of the project and open it.

2. **Run the Program**:  
   - Right-click the project in Eclipse and select **Run As** > **Nios II Hardware**.  
   - The `.elf` file will run on the Nios II softcore.
   ![Running the binary software code](https://drive.google.com/file/d/1MPXtZFQB3rY04FMQe0ZvcDgRfpbxqaKe/view?usp=sharing)

### Step 4: Using the Touch Screen Interface

1. **View Images**:  
   - The system will display images from the `/jpg` directory on the SD card.  
   - Use the touch screen to **browse through the images**.
   ![Main Menu](https://drive.google.com/file/d/1oq2XEvLVeduFq5ClWynsTx752hwpRqUJ/view?usp=sharing)

2. **Apply Filters**:  
   - Touch the screen once to apply a **grayscale filter** to the current image.
   ![Gray Filter](https://drive.google.com/file/d/1PGlzZDyZVjIs3iW7DoVTPLJedHcEhWWy/view?usp=sharing)
   - Touch again to apply the **edge detection filter**.
   ![Edge Detection](https://drive.google.com/file/d/1dCWh3iZvwy4sTenTnEEWVkSTB0xFh2om/view?usp=sharing)
   - A further touch will return you to the **image browser menu**.

## Notes

- Ensure that the SD card is properly formatted and contains images in the correct format (`.jpg`).
- For best performance, use 800x480 resolution images or multiples of this size.
