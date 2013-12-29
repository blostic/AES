#include <stdio.h>

#define byte unsigned char /* 8-bit byte*/
#define KEY_len 128 /* 128 or 192 or 256*/
#define ROUND_cnt 10
#define min_state_size 16
#define multip 1 /* if text to encode is longer then min_state_size then mult := min int >= text_size/min_state_size*/

byte buf_in[min_state_size*multip];
byte buf_out[min_state_size*multip];

byte state[min_state_size] = {  /*48656c6c6f20776f726c640000000000*/
  0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00
};


void String_to_hex(char* msg, int len, int start_pos){
    int i;
    for(i = 0; i < len; i++)
    {
        state[i] = msg[start_pos+i];
    };
    if (len < min_state_size)
        for (i = len; i<min_state_size; i++)
            state[i]=0;
}

void Hex_to_string(char * msg, int len, int start_pos){
    int i;
    for (i=0;i<len;i++)
        msg[i+start_pos] = state[i];
}

byte roundKey[min_state_size*(ROUND_cnt+1)] = {/*546573746f7779206865786164656379*/
  0x54, 0x65, 0x73, 0x74,
  0x6f, 0x77, 0x79, 0x20,
  0x68, 0x65, 0x78, 0x61,
  0x64, 0x65, 0x63, 0x79
};
/*

sprawdzenie key = 256

0x00, 0x04, 0x08, 0x0c,
0x01, 0x05, 0x09, 0x0d,
0x02, 0x06, 0x0a, 0x0e,
0x03, 0x07, 0x0b, 0x0f,

0x10, 0x14, 0x18, 0x1c,
0x11, 0x15, 0x19, 0x1d,
0x12, 0x16, 0x1a, 0x1e,
0x13, 0x17, 0x1b, 0x1f

00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f
10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f
a5 73 c2 9f a1 76 c4 98 a9 7f ce 93 a5 72 c0 9c
16 51 a8 cd 02 44 be da 1a 5d a4 c1 06 40 ba de
ae 87 df f0 0f f1 1b 68 a6 8e d5 fb 03 fc 15 67
6d e1 f1 48 6f a5 4f 92 75 f8 eb 53 73 b8 51 8d
c6 56 82 7f c9 a7 99 17 6f 29 4c ec 6c d5 59 8b
3d e2 3a 75 52 47 75 e7 27 bf 9e b4 54 07 cf 39
0b dc 90 5f c2 7b 09 48 ad 52 45 a4 c1 87 1c 2f
45 f5 a6 60 17 b2 d3 87 30 0d 4d 33 64 0a 82 0a
7c cf f7 1c be b4 fe 54 13 e6 bb f0 d2 61 a7 df
f0 1a fa fe e7 a8 29 79 d7 a5 64 4a b3 af e6 40
25 41 fe 71 9b f5 00 25 88 13 bb d5 5a 72 1c 0a
4e 5a 66 99 a9 f2 4f e0 7e 57 2b aa cd f8 cd ea
24 fc 79 cc bf 09 79 e9 37 1a c2 3c 6d 68 de 36

test_128_key:
  0x69, 0xa5, 0x65, 0x69,
  0x20, 0x20, 0x6e, 0x74,
  0xe2, 0x2a, 0x63, 0x6f,
  0x99, 0x6d, 0x68, 0x2a

Expandes Key schould looks like:

69 20 e2 99 a5 20 2a 6d 65 6e 63 68 69 74 6f 2a
fa 88 07 60 5f a8 2d 0d 3a c6 4e 65 53 b2 21 4f
cf 75 83 8d 90 dd ae 80 aa 1b e0 e5 f9 a9 c1 aa
18 0d 2f 14 88 d0 81 94 22 cb 61 71 db 62 a0 db
ba ed 96 ad 32 3d 17 39 10 f6 76 48 cb 94 d6 93
88 1b 4a b2 ba 26 5d 8b aa d0 2b c3 61 44 fd 50
b3 4f 19 5d 09 69 44 d6 a3 b9 6f 15 c2 fd 92 45
a7 00 77 78 ae 69 33 ae 0d d0 5c bb cf 2d ce fe
ff 8b cc f2 51 e2 ff 5c 5c 32 a3 e7 93 1f 6d 19
24 b7 18 2e 75 55 e7 72 29 67 44 95 ba 78 29 8c
ae 12 7c da db 47 9b a8 f2 20 df 3d 48 58 f6 b1

*/
const byte sBox[256] = {+

   0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
   0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
   0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
   0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
   0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
   0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
   0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
   0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
   0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
   0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
   0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
   0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
   0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
   0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
   0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
   0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
};

byte Rcon[16] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a};

void Rotate(byte *a, byte* b, byte* c, byte* d){
  byte tmp;
  tmp = *a;
  *a = *b;
  *b = *c;
  *c = *d;
  *d = tmp;
}

void print(byte x[]){
   int i;
   for (i=0; i < 16; i++)
      printf("%02x",x[i]);
   puts("");
}

int iteracja = 0;

void KeySchedule(){

  int it = 0;
  int i,x,y;

  int b,n;

  switch(KEY_len)
  {
    case 128: { n = 16; b = 176; break; }
    case 192: { n = 24; b = 208; break; }
    case 256: { n = 32; b = 240; break; }
    default: printf("Key Size Incorrect");
  }

  int offset = n;

  while(offset<b)
  {

/*
We do the following to create 4 bytes of expanded key:
We create a 4-byte temporary variable, t
We assign the value of the previous four bytes in the expanded key to t
We perform the key schedule core (see above) on t, with i as the rcon iteration value
We increment i by 1
We exclusive-OR t with the four-byte block n bytes before the new expanded key. This becomes the next 4 bytes in the expanded key
*/

    roundKey[offset]    = sBox[roundKey[offset-9] ] ^ roundKey[offset - n ] ^ Rcon[it];
    roundKey[offset+4]  = sBox[roundKey[offset-5] ] ^ roundKey[offset - n + 4 ];
    roundKey[offset+8]  = sBox[roundKey[offset-1] ] ^ roundKey[offset - n + 8 ];
    roundKey[offset+12] = sBox[roundKey[offset-13]] ^ roundKey[offset - n + 12];

/*
We then do the following three times to create the next twelve bytes of expanded key:
We assign the value of the previous 4 bytes in the expanded key to t
We exclusive-OR t with the four-byte block n bytes before the new expanded key. This becomes the next 4 bytes in the expanded key
*/

    for(x = 1; x < 4; ++x)
      for(y = 0; y < 4; ++y)
        roundKey[offset+y*4+x] = roundKey[offset+y*4+x-1] ^ roundKey[offset+y*4+x-n];
    ++it;

/*
If we are processing a 256-bit key, we do the following to generate the next 4 bytes of expanded key:
We assign the value of the previous 4 bytes in the expanded key to t
We run each of the 4 bytes in t through Rijndael's S-box
We exclusive-OR t with the 4-byte block n bytes before the new expanded key. This becomes the next 4 bytes in the expanded key.
*/

    if (KEY_len == 256 )
    {
      roundKey[offset + 16 ]    = sBox[roundKey[offset + 3 ] ] ^ roundKey[offset - 16 ];
      roundKey[offset + 20 ]    = sBox[roundKey[offset + 7 ] ] ^ roundKey[offset - 12 ];
      roundKey[offset + 24 ]    = sBox[roundKey[offset + 11] ] ^ roundKey[offset - 8  ];
      roundKey[offset + 28 ]    = sBox[roundKey[offset + 15] ] ^ roundKey[offset - 4  ];

      for(x = 1; x < 4; ++x)
        for(y = 0; y < 4; ++y)
          roundKey[offset+y*4+x + 16 ] = roundKey[offset+y*4+x-1 + 16] ^ roundKey[offset+y*4+x-n + 16];

    }
    if (KEY_len == 192)
    {
      for(x = 0; x < 2; ++x)
        for(y = 0; y < 4; ++y)
          roundKey[offset+y*4+x + 16 ] = roundKey[offset+y*4+x-1 + 16] ^ roundKey[offset+y*4+x-n + 16];
    }
    offset += n;
/*
If we are processing a 128-bit key, we do not perform the following steps. If we are processing a 192-bit key, we run the following steps twice.
If we are processing a 256-bit key, we run the following steps three times:
We assign the value of the previous 4 bytes in the expanded key to t
We exclusive-OR t with the four-byte block n bytes before the new expanded key. This becomes the next 4 bytes in the expanded key
*/
  }
    for(i = 0;i<b/16;i++)
    {
      for(x = 0; x < 4; ++x)
      {
        for(y = 0; y < 4; ++y)
        {
          printf("%02x ",roundKey[i*16+y*4+x]);
        }
      }
        printf("\n");
    }
}



void SubBytes(){
    int i;
  for(i = 0; i<16; ++i)
    state[i] = sBox[state[i]];
}

void ShiftRows(){
  int i, j;
  for(i = 0; i < 4; ++i)
    for(j = 0; j<i; ++j)
      Rotate(&state[4*i], &state[4*i+1], &state[4*i+2], &state[4*i+3]);
}

void AddRoundKey(){
  int i;
  for(i = 0; i < 16; ++i)
    state[i] ^= roundKey[i+16*iteracja];
}

byte MC_Matrix[16] = {
  2, 3, 1, 1,
  1, 2, 3, 1,
  1, 1, 2, 3,
  3, 1, 1, 2
};

byte mult(byte a, byte b) {
        byte p = 0;
        byte counter;
        byte carry;
        for (counter = 0; counter < 8; counter++) {
                if ((b & 1)!=0){
                  p ^= a;
                }
                carry = (a & 0x80);                
                a <<= 1;
                if (carry){
                  a ^= 0x1B;
                }
                b >>= 1;
        }
        return p;
}

void multiplyColumn(byte *a0, byte *a1, byte *a2, byte *a3){
  byte b0 = *a0,
       b1 = *a1,
       b2 = *a2,
       b3 = *a3;

  *a0 = mult(b0, MC_Matrix[0])
      ^ mult(b1, MC_Matrix[1])
      ^ mult(b2, MC_Matrix[2])
      ^ mult(b3, MC_Matrix[3]);

  *a1 = mult(b0, MC_Matrix[4])
     ^ mult(b1, MC_Matrix[5])
     ^ mult(b2, MC_Matrix[6])
     ^ mult(b3, MC_Matrix[7]);

  *a2 = mult(b0, MC_Matrix[8])
     ^ mult(b1, MC_Matrix[9])
     ^ mult(b2, MC_Matrix[10])
     ^ mult(b3, MC_Matrix[11]);

  *a3 = mult(b0, MC_Matrix[12])
     ^ mult(b1, MC_Matrix[13])
     ^ mult(b2, MC_Matrix[14])
     ^ mult(b3, MC_Matrix[15]);
}

void MixColumns(){
  int i;
  for(i = 0; i < 4; ++i)
    multiplyColumn(&state[i], &state[i+4], &state[i+8], &state[i+12]);
}



byte InvMC_Matrix[16] = {
  14, 11, 13,  9,
   9, 14, 11, 13,
  13,  9, 14, 11,
  11, 13,  9, 14
};

void Inv_multiplyColumn(byte *a0, byte *a1, byte *a2, byte *a3){
  byte b0 = *a0,
       b1 = *a1,
       b2 = *a2,
       b3 = *a3;

  *a0 = mult(b0, InvMC_Matrix[0])
     ^ mult(b1, InvMC_Matrix[1])
     ^ mult(b2, InvMC_Matrix[2])
     ^ mult(b3, InvMC_Matrix[3]);

  *a1 = mult(b0, InvMC_Matrix[4])
     ^ mult(b1, InvMC_Matrix[5])
     ^ mult(b2, InvMC_Matrix[6])
     ^ mult(b3, InvMC_Matrix[7]);

  *a2 = mult(b0, InvMC_Matrix[8])
     ^ mult(b1, InvMC_Matrix[9])
     ^ mult(b2, InvMC_Matrix[10])
     ^ mult(b3, InvMC_Matrix[11]);

  *a3 = mult(b0, InvMC_Matrix[12])
     ^ mult(b1, InvMC_Matrix[13])
     ^ mult(b2, InvMC_Matrix[14])
     ^ mult(b3, InvMC_Matrix[15]);
}

void InvMixColumns(){
  int i;
  for(i = 0; i < 4; ++i)
    Inv_multiplyColumn(&state[i], &state[i+4], &state[i+8], &state[i+12]);
}

void InvShiftRows(){

  int i,j,k;
  for(i = 0; i < 4; ++i)
    for(j=0; j<i; ++j)
      for(k=0; k<3; ++k)
        Rotate(&state[4*i], &state[4*i+1], &state[4*i+2], &state[4*i+3]);

}

byte Inv_sBox[256] = {
  0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
  0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
  0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e,
  0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25,
  0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92,
  0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84,
  0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06,
  0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b,
  0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73,
  0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e,
  0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b,
  0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4,
  0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f,
  0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef,
  0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61,
  0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d
};

void InvSubBytes(){
    int i;
  for(i=0; i<16; i++)
    state[i] = Inv_sBox[state[i]];
}


int main(int argc, char** argv){

char* msg;
    String_to_hex("Hello world", 11, 0);
  print(state);

  KeySchedule();

  AddRoundKey();
  for(iteracja = 1; iteracja < ROUND_cnt; ++iteracja){
    SubBytes();
    ShiftRows();
    MixColumns();
    AddRoundKey();
  }
  SubBytes();
  ShiftRows();
  AddRoundKey();

  print(state); /*encrypted*/

  AddRoundKey();
  InvShiftRows();
  InvSubBytes();
  for(iteracja = ROUND_cnt-1; iteracja > 0; --iteracja){
    AddRoundKey();
    InvMixColumns();
    InvShiftRows();
    InvSubBytes();
  }
  AddRoundKey();

  print(state);
  Hex_to_string(msg,11,0);
  printf("%s", msg);

  return 0;

}
