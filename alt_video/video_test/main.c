#include "stdio.h"
#include "stdlib.h"
#include "io.h"
#include "altera_avalon_sgdma.h"
#include "altera_avalon_sgdma_descriptor.h"
#include "altera_avalon_sgdma_regs.h"
#include "alt_types.h"
#include "alt_video_display.h"


int main()
{
      alt_video_display* display_global;
      printf("Initializing LCD display controller  ");
      display_global = alt_video_display_init( "/dev/sgdma_pixel",     // Name of video controller
                                              800,                              // Width of display
                                              480,                              // Height of display
                                              32,                               // Color depth (32 or 16)
                                              ALT_VIDEO_DISPLAY_USE_HEAP,       // Where we want our frame buffers
                                              ALT_VIDEO_DISPLAY_USE_HEAP,//0,                                // Where we want our descriptors (n/a here)
                                              2 );  
       if( display_global )
         printf(" - OK\n");
       else
         printf(" - FAILED\n"); 
       alt_video_display_clear_screen(display_global,0xF0);
}
