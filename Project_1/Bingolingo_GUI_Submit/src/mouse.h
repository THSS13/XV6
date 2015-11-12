// PC mouse interface constants

#define MSSTATP         0x64    // mouse controller status port(I)
#define MSS_DIB         0x01    // mouse data in buffer
#define MSDATAP         0x60    // mouse data port(I)

#define LEFT_BTN        0x01
#define RIGHT_BTN       0x02
#define MIDDLE_BTN      0x04
#define CHECK_FLAG      0X08
#define X_SIGN          0x10
#define Y_SIGN          0x20
#define X_OVERFLOW      0x40
#define Y_OVERFLOW      0x80

#define X_SPEED         1
#define Y_SPEED         1

#define LEFT_BTN_DN     0x01
#define LEFT_BTN_UP     0x02
#define RIGHT_BTN_DN    0x04
#define RIGHT_BTN_UP    0x08
