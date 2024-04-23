#include "stdio.h"
#include "stdlib.h"
#include "io.h"
#include "sys/alt_alarm.h"
#include "altera_avalon_sgdma.h"
#include "altera_avalon_sgdma_descriptor.h"
#include "altera_avalon_sgdma_regs.h"
#include "alt_types.h"
#include "alt_video_display.h"
#include "fat_file.h"
#include "fat.h"
#include "sd_controller.h"
#include "alt_tpo_lcd/alt_tpo_lcd.h"
#include "control.h"
#include "touch_spi.h"
#include "jpeg/jpeglib.h"
#include "jpeg/jerror.h"
#include "skin1.h"
#include "fonts/fonts.h"
#include "graphics_lib/simple_graphics.h"
#include "string.h"
#include "unistd.h"
#define  WIDTH 800
#define  HEIGHT 480
#define  NUM_FRAME 1
#define UI_MARGIN 20
#define BACK_BUTTON_X_MIN (50 - UI_MARGIN)
#define BACK_BUTTON_X_MAX (BACK_BUTTON_X_MIN + backward_b_w + UI_MARGIN)
#define BACK_BUTTON_Y_MIN ((HEIGHT/2) - UI_MARGIN)
#define BACK_BUTTON_Y_MAX (BACK_BUTTON_Y_MIN + backward_b_h + UI_MARGIN)
////function delaration
int write_buffer(alt_video_display *display_global,char *pic_name,int frame_write_index);
void draw_toolbox(alt_video_display *display,int frame_write_index);
void draw_play_button(alt_video_display *display,int frame_write_index);
//////////////Function Definition
typedef struct{
        unsigned int frame_buff[HEIGHT][WIDTH];
}video_frame_buffer;

volatile unsigned int my_buffer[480*800]= {0,};
int my_index = 0;

volatile unsigned int my_buffer_gray[480*800]= {0,};
int my_index_gray = 0;


volatile unsigned int my_buffer_edge[480*800]= {0,};
int my_index_edge = 0;

 unsigned int * buffer_pointer;

char name_list[60][50]={0,};

void file_browser_window();
void file_browser_window(alt_video_display *display_global)
{
	   char text[50];
	   int border_color = DODGERBLUE_24;

	   vid_paint_block (0, 0, 799, 479, KHAKI_24, display_global);												//Paint Background
	   sprintf(text, "%s%s", "FILE 1 : ", name_list[0] );
	   vid_print_string_alpha(200, 62, YELLOW_24 , MEDIUMVIOLETRED_24, tahomabold_32, display_global,text);		//Display File 1 Name
	   sprintf(text, "%s%s", "FILE 2 : ", name_list[1] );
	   vid_print_string_alpha(200, 217, YELLOW_24 , MEDIUMVIOLETRED_24, tahomabold_32, display_global,text);	//Display File 2 Name
	   sprintf(text, "%s%s", "FILE 3 : ", name_list[2] );
	   vid_print_string_alpha(200, 372, YELLOW_24 , MEDIUMVIOLETRED_24, tahomabold_32, display_global,text);	//Display File 3 Name

	   int i;
	   for(i = 0; i < 10 ; i++)
	   {
		   vid_draw_line(1    , 140 + i , 800   , 140 + i , 1, border_color, display_global);					//Upper middle line
		   vid_draw_line(1    , 295 + i , 800   , 295 + i , 1, border_color, display_global);					//Lower middle line
		   vid_draw_line(1    , i       , 800   , i       , 1, border_color, display_global);					//Upper border
		   vid_draw_line(1    , 470 + i , 800   , 470 + i , 1, border_color, display_global);					//Lower border
		   vid_draw_line(i    , 0       , i     , 479     , 0, border_color, display_global);					//Left  border
		   vid_draw_line(790+i, 0       , 790+i , 479     , 0, border_color, display_global);					//Right border

	   }



}


void jpeg_decode(unsigned int *frame, FILE * infile, char * filename, alt_video_display *display_global);
void jpeg_decode(unsigned int *frame, FILE * infile, char * filename, alt_video_display *display_global)
{
	TOUCH_HANDLE hTouch;
	      hTouch = Touch_Init(TOUCH_PANEL_SPI_BASE, TOUCH_PANEL_PEN_IRQ_N_BASE, TOUCH_PANEL_PEN_IRQ_N_IRQ);
	      if (!hTouch)
	      {
	          printf("Failed to init touch");
	      }

	  int width, height, dwidth, dheight;
	  int dx = 0, dy = 0;
	  float dscaling = 0.0, output_scale_factor, scale_factor_x, scale_factor_y;
	  int jpeg_scaled_width=0, jpeg_scaled_height=0, output_is_scaled=0;
	  int rownum=0, colnum=0, outrow=0, outcol=0;
	  int output_scaled_width=0, output_scaled_height=0;
	  char error_string[100];

	  struct jpeg_decompress_struct cinfo;
	  struct jpeg_error_mgr err;
	  register JSAMPROW outptr;
	  JSAMPARRAY buffer;    /* Output row buffer */
	  int row_stride;       /* physical row width in output buffer */

	  cinfo.err = jpeg_std_error(&err);

	  jpeg_create_decompress(&cinfo);
	  jpeg_stdio_src(&cinfo, infile);
	  (void) jpeg_read_header(&cinfo, TRUE);

	  width = cinfo.image_width;
	  height = cinfo.image_height;

	  dwidth = WIDTH - width;
	  dheight = HEIGHT - height;

	  /*
	   * JPEG dimensions are larger than the screen size. Figure out how
	   * much to scale the image during JPEG decode. The JPEG library
	   * supports, 1/1, 1/2, 1/4, and 1/8 scaling only.
	   */
	  if ((dwidth < 0)||(dheight < 0)) {
	    // Calculate ratio of LCD screen size to full image size
	    dscaling = (dwidth >= dheight) ?
	      ((float)HEIGHT/(float)height) : ((float)WIDTH/(float)width);

	    // Determine the next *largest* JPEG scale size than we need so
	    // that we can down-scale to fill the screen
	    if ((dscaling < 1.0) && (dscaling >= 0.5))  {
	        cinfo.scale_num = 1;
	        cinfo.scale_denom = 1;
	    }
	    else if ((dscaling < 0.5) && (dscaling >= 0.25)) {
	        cinfo.scale_num = 1;
	        cinfo.scale_denom = 2;
	    }
	    else if ((dscaling < 0.25) && (dscaling >= 0.125)) {
	        cinfo.scale_num = 1;
	        cinfo.scale_denom = 4;
	    }
	    else if ((dscaling < 0.125) && (dscaling >= 0.0625)) {
	      cinfo.scale_num  = 1;
	      cinfo.scale_denom = 8;
	    }
	    else {
	      sprintf(error_string,
	        "Image '%s' is too lage. Skipping file.", filename);
	      printf("%s\n",error_string);
	      ////lcd_display_error(pic_viewer, error_string);
	      return;
	    }

	    // Find the size of the resultant image from the jpeg decode operation
	    jpeg_scaled_width = (width*((float)cinfo.scale_num/(float)cinfo.scale_denom));
	    jpeg_scaled_height = (height*((float)cinfo.scale_num/(float)cinfo.scale_denom));

	    // Determine a scaling "Factor" -- using the dimension most differing
	    // from the screen size. This factor will be applied in both
	    // dimensions to keep a constant aspect ratio in the final image
	    scale_factor_x = ((float)jpeg_scaled_width / (float)WIDTH);
	    scale_factor_y = ((float)jpeg_scaled_height / (float)HEIGHT);

	    if(scale_factor_y > scale_factor_x) {
	      output_scale_factor = scale_factor_y;
	    }
	    else {
	      output_scale_factor = scale_factor_x;
	    }

	    // Now calculate the final output image size which should
	    // fit into the frame buffer.
	    output_scaled_width = ((float)jpeg_scaled_width / output_scale_factor);
	    output_scaled_height = ((float)jpeg_scaled_height / output_scale_factor);

	    // Allow for rounding error that may cause us to go out of bounds
	    if(output_scaled_width > WIDTH) {
	      output_scaled_width = WIDTH;
	    }
	    if(output_scaled_height > HEIGHT) {
	      output_scaled_height = HEIGHT;
	    }

	    dwidth = WIDTH - output_scaled_width;
	    dheight = HEIGHT - output_scaled_height;

	    dx = (dwidth > 0) ? (dwidth / 2) : 0;
	    dy = (dheight > 0) ? (dheight / 2) : 0;

	    output_is_scaled = 1;
	  }
	  else {
	    dx = (dwidth == 0) ? 0 : (dwidth / 2);
	    dy = (dheight == 0) ? 0 : (dheight / 2);
	    output_is_scaled = 0;
	  }

	#if DEBUG_PRINT
	  printf("[jpeg_decode]: JPEG File info:\n");
	  printf("  Width: %d,  Height: %d, Num components: %d, Color space: %d\n",
	    cinfo.image_width, cinfo.image_height,
	    cinfo.num_components, cinfo.out_color_space);
	  printf("  Scale factor: 1/%d, dwidth: %d, dheight: %d, dscaling: %f\n",
	      cinfo.scale_denom, dwidth, dheight, dscaling);
	#endif

	  (void) jpeg_start_decompress(&cinfo);
	  row_stride = cinfo.output_width * cinfo.output_components;
	  buffer = (*cinfo.mem->alloc_sarray)((j_common_ptr) &cinfo, JPOOL_IMAGE, row_stride, 1);


	  unsigned int my_buffer[480*800];
	  unsigned int my_buffer_1d[480*800];
	  unsigned int my_index = 0;
	  while (cinfo.output_scanline < cinfo.output_height) {
	    // Read a scanline every time
	    (void) jpeg_read_scanlines(&cinfo, buffer, 1);

	    // Ultra-simple non-accurate scaling method: Periodically throw away one
	    if(output_is_scaled) {
	      if((rownum * output_scaled_height) < (outrow * jpeg_scaled_height)) {
	        rownum++;
	        continue;
	      }
	    }

	    JDIMENSION num_cols = cinfo.output_width;
	    outptr = *buffer;								//output row buffer (3 RGB)

	    for (colnum = 0, outcol = 0; colnum < (num_cols); colnum++) {
	      // Non-accurate scaling: Periodically throw away one
	      if(output_is_scaled) {
	        if( (colnum * output_scaled_width) <
	            (outcol * jpeg_scaled_width) ) {
	          outptr += 3;
	          continue;
	        }
	      }

	      /*
	       * Copy pixel from decoded JPEG scanline buffer to buffer
	       * that will be copied to video display
	       */												//outcol and outrow are the index, dx,dy are for scaled image

	      if ((outcol+dx< WIDTH) && (outrow+dy < HEIGHT)) {
	        /* Color */
	        if(cinfo.num_components == 3) {
	        	* (frame+(outrow+dy)*WIDTH+outcol+dx) =
	        		            ( (outptr[0] << 16) + (outptr[1] << 8) + outptr[2] );	//Putting RGB data on the current Pixel Pointer


	        	//Gray Scale
	        	//Done by obtaining the average of the three colors RGB
	        	//Then assign this average value to the Pixel
	        	outptr[0] = ( outptr[0] + outptr[1] + outptr[2] )/3; 					//taking average of the 3 RGB values
	        	outptr[1] = outptr[0];								 					//assign the average value to each of the 3
	        	outptr[2] = outptr[0];
	        	//Saving the Gray scale filtered image into a Buffer
	        	my_buffer[my_index] = ( (outptr[0] << 16) + (outptr[1] << 8) + outptr[2] );
	        	my_buffer_1d[my_index] = outptr[0];

	        }
	        /* Grayscale */
	        else if(cinfo.num_components == 1) {

	        }
	      }

	      if(cinfo.num_components == 3) {
	        outptr += 3;
	      }
	      else if(cinfo.num_components == 1) {
	        outptr++;
	      }

	      outcol++;
	      my_index++;
	    } /* for(columns in decoded JPEG image */

	    rownum++;
	    outrow++;
	  } /* while (rows in decoded JPEG image */

	  int x=0,y=0;
	  Touch_EmptyFifo(hTouch);
	  while(1)                                   //UPON TOUCH DISPLAY GRAY FILTER
	     {
	        if (!Touch_GetXY(hTouch, &x,&y))
	        continue;
	        printf("x=%d,y=%d\r\n",x,y);
	  	    if ((x<=750 && x>=50)&& (y<=800 && y>=25)) //Trigger area (The Entire Display area)
	           {
	        	for(my_index = 0 ; my_index < 480*800; my_index++){
	        			  * (frame+my_index) = my_buffer[my_index];
	        		  }
	        	break;
	           }
	      }

	  Touch_EmptyFifo(hTouch);
	  while(1)									//UPON TOUCH DISPLAY EDGE FILTER
	  	     {
	  	        if (!Touch_GetXY(hTouch, &x,&y))
	  	        continue;
	  	        printf("x=%d,y=%d\r\n",x,y);
  	  	        if ((x<=750 && x>=50)&& (y<=800 && y>=25)) //Trigger area (The Entire Display area)
	  	           {
	  	        	break;
	  	           }
	  	      }
	  //Edge Detection Algorithm
	  for(my_index = 0 ; my_index < 480*800; my_index++){
		  * (frame+my_index) = my_buffer[my_index];
	  }
	  unsigned int *tempin, *tempout;
	  unsigned int sum = 0;

	  tempin = my_buffer_1d;
	  tempout = my_buffer_1d;
	  int i,j;

	  for(i = 1; i+1 < 480 ; i++) {
	      for(j = 1; j+1 < 800; j++) {
	          sum = 0;
	          	  	  	  	  	  	  //The Kernel in use is a simple Horizontal symmetrical Kernel

	          sum = tempin[800*(i-1) + (j-1)]*(-1) +   tempin[800*(i-1) + (j)]*(-1) +    tempin[800*(i-1) + (j+1)]*(-1)

	               +tempin[800*(i) + (j-1)]*  (0) +   tempin[800*(i) + (j)]*  (0) +    tempin[800*(i) + (j+1)]*  (0)

	               +tempin[800*(i+1) + (j-1)]*(1) +   tempin[800*(i+1) + (j)]*(1) +    tempin[800*(i+1) + (j+1)]*(1);

	          int temp = 0;
	          temp = sum;
	          // Thresholding:
	          if(temp > 20) temp = 255;
	          else temp = 0;

	          * (frame+(i)*800+j) =
	                      ( (temp << 16) + (temp << 8) + temp );		//Display the result of edge Detection to
	          	  	  	  	  	  	  	  	  	  	  	  	  	  	  	//the current pixel
	      }
	  }

	  Touch_EmptyFifo(hTouch);
	  while(1)									//UPON TOUCH TERMINATE TO THE MAIN BROWSER
	  	  	     {
	  	  	        if (!Touch_GetXY(hTouch, &x,&y))
	  	  	        continue;
	  	  	        printf("x=%d,y=%d\r\n",x,y);
	  	  	        if ((x<=750 && x>=50)&& (y<=800 && y>=25)) //Trigger area (The Entire Display area)
	  	  	           {
	  	  	        	break;
	  	  	           }
	  	  	      }




	  /* Finish up */
	  (void) jpeg_finish_decompress(&cinfo);
	  jpeg_destroy_decompress(&cinfo);
}



/////write to the frame_write_index specified frame buffer
int write_buffer(alt_video_display *display_global,char *pic_name,int frame_write_index)
{
     FILE * infile;														//file pointer
     char * cp_pic_name = (char*)malloc(100);							//allocate memory for image name
     sprintf(cp_pic_name,"/dev/sd_card_controller/jpg/%s",pic_name);	//obtain the image name
     infile = fopen(cp_pic_name,"rb");									//open the image file
     if (infile == NULL){
        printf("open file failed!\n");
        return -1;
     }
     unsigned int  *frame = (unsigned int *)display_global->buffer_ptrs[frame_write_index]->buffer;
     jpeg_decode(frame, infile, cp_pic_name, display_global);			//passing the image file pointer
     fclose(infile);
     free(cp_pic_name);
     return 0;
}


/////////////////////////////////////////////////////////////main//////////////////////////////////////////
int main()
{

      int result;
      ////Initial Touch panel
      TOUCH_HANDLE hTouch;
      hTouch = Touch_Init(TOUCH_PANEL_SPI_BASE, TOUCH_PANEL_PEN_IRQ_N_BASE, TOUCH_PANEL_PEN_IRQ_N_IRQ);
      if (!hTouch)
      {
          printf("Failed to init touch");
      }
      ////Initial LCD Display
      alt_video_display* display_global;
      printf("Initializing LCD display controller\n  ");
      display_global = alt_video_display_init( "/dev/sgdma_pixel",    			 // Name of video controller
                                              800,                               // Width of display
                                              480,                               // Height of display
                                              32,                                // Color depth (32 or 16)
                                              SDRAM_BASE+SDRAM_SPAN/2,     	     // Where we want our frame buffers
                                              DESCRIPTOR_MEM_BASE,               // Where we want our descriptors
                                              NUM_FRAME );
     if( display_global )
         printf(" - LCD Initialization OK\n");
     else
         printf(" - LCD FAILED\n");
     alt_video_display_clear_screen(display_global,0x0);
     ///Setup the LCD parameter
     alt_tpo_lcd s_lcd;
     alt_tpo_lcd * lcd = &s_lcd;
     lcd->scen_pio = LCD_I2C_EN_BASE;
     lcd->scl_pio  = LCD_I2C_SCL_BASE;
     lcd->sda_pio  = LCD_I2C_SDA_BASE;
     result = alt_tpo_lcd_init(lcd, 800, 480);
     if(result)
       {
         printf("LCD spi write failed\n"); // failure
       }
     else
       {
         printf("LCD spi write OK\n"); // success
       }
     ///Initial the SD Card
     int volumes_mounted;
     sd_set_clock_to_max( 80000000 ); ////set spi clock divider coeff.
     usleep (1000);
     volumes_mounted = sd_fat_mount_all();////mount fat file system.
     if( volumes_mounted <= 0 )
     {
        printf( "SD Card Mount FAILED\n" );
     }
     else
     {
        printf("SD Card Mount OK\n");
     }
     /////Read out the SD card specified subdirectory files
     char * filelist_buff = (char *)malloc(32768);
     memset(filelist_buff,0,32768);
     int num_files = 0;
     num_files = sd_list("/jpg/",filelist_buff);
     num_files = num_files-2; ////subtract ". .."
     alt_u32 i=0,j=0;
     while (1)
     {

      for(i=0;;i++)
      {
        if (*(filelist_buff+i)==0) break;
      }
      printf("%s\n",filelist_buff);
      if (*filelist_buff!='.') //discard the . .. directories;
      {
      strcpy(name_list[j],filelist_buff);
      j++;
      }
      filelist_buff = filelist_buff+1+i;
      if (*filelist_buff==0) break;
     }
     ////////////////////////////////////////////////////
     ///////
     int x=0,y=0;
     Touch_EmptyFifo(hTouch);
     char text[50];
   while(1)
   {
	   file_browser_window(display_global);
	   Touch_EmptyFifo(hTouch);
	   usleep(1000000);
	   while(1)
	   {
	       if (!Touch_GetXY(hTouch, &x,&y))
	       continue;
	       printf("x=%d,y=%d\r\n",x,y);
	       if ((x<=750 && x>=50)&& (y<=199 && y>=25)) //Trigger area upper File 1
	         {
	    	   write_buffer(display_global,name_list[0],display_global->buffer_being_written);
	    	   break;
	         }

	       if ((x<=750 && x>=50)&& (y<=375 && y>=200)) //Trigger area middle File 2
	         {
	    	   write_buffer(display_global,name_list[1],display_global->buffer_being_written);
	    	   break;
	         }

	       if ((x<=750 && x>=50)&& (y<=550 && y>=375)) //Trigger area lower File 3
	         {
	    	   write_buffer(display_global,name_list[2],display_global->buffer_being_written);
	    	   break;
	         }
	   }

   }



   free(filelist_buff);
   return result;
}















