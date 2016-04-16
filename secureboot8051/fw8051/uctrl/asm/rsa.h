#ifndef RSA_H
#define RSA_H

#ifdef C
#define XDATA_VAR(addr, type, name) type name
#define XDATA_ARR(addr, size, type, name) type name[size]
#define XDATA_PTR(addr, type, name) type* name
#define XDATA_STRUCT(addr, type, name) struct type name
#define XDATA
#define CODE
#else
#define XDATA_VAR(addr, type, name) __xdata __at(addr) type name
#define XDATA_ARR(addr, size, type, name) __xdata __at(addr) type name[size]
#define XDATA_PTR(addr, type, name) __xdata type* __xdata __at(addr) name
#define XDATA_STRUCT(addr, type, name) __xdata __at(addr) struct type name
#define XDATA __xdata
#define CODE __code
#endif

#ifdef CBMC 
#define MAX_PRG_SIZE 50
#define MAX_IM_SIZE  100
#define N 16
#define H 4
#define K1 4
#define K2 4
#define BUFF_SIZE 100
#else
#define MAX_PRG_SIZE 0x5000
#define MAX_IM_SIZE  0x2000
#define N 256
#define H 20
#define K1 16
#define K2 16
#ifdef C
#define BUFF_SIZE 0x2000
#endif
#endif


#ifdef C
int pt_add(unsigned char* start, unsigned int size);
int writec(unsigned char* addr, unsigned char data, unsigned char trusted);
int writecarr(unsigned char* addr, unsigned char* data, unsigned int len);
int writei(unsigned int* addr, unsigned int data);
int writeptr(unsigned char** addr, unsigned char* data);
#else
#define writecarr(addr, data, len) for(i=0; i<len; i++) addr[i]=data[i];
#define writec(addr, data) *(addr) = data;
#define writei(addr, data) *(addr) = data;
#define writeptr(addr, data) *(addr) = data;
#define c_load(skipread)
#define c_sha(len, save)
#define c_exp()
#endif

#ifdef CBMC
unsigned char* nondet_ptr();
unsigned int nondet_uint();
extern unsigned char sig_val, addr_val;
#endif

struct RSAmsg{
    unsigned char padbyte;
    unsigned char m[N-K2-K1-1];
    unsigned char zeros[K1];
    unsigned char r[K2];
};

struct acc_regs{
    unsigned char start;
    unsigned char state;
    XDATA unsigned char *rd_addr;
    XDATA unsigned char *wr_addr;
    unsigned int len;
};

struct RSA_regs{
    struct RSAmsg m;
    unsigned char exp[N];
    unsigned char n[N];
    unsigned char start;
    unsigned char state;
    unsigned char *opaddr;
};

extern XDATA_VAR(0xFE00, struct acc_regs, sha_regs);
extern XDATA_VAR(0xF9F0, struct acc_regs, memwr_regs);
extern XDATA_VAR(0xFA00, struct RSA_regs, rsa_regs);

#ifndef C
// page table permissions
extern XDATA_ARR(0xFF80, 32, unsigned char, pt_wren);
extern XDATA_ARR(0xFFA0, 32, unsigned char, pt_rden);
#endif

int lock_wr(unsigned char* startaddr, unsigned char* endaddr);
int unlock_wr(unsigned char* startaddr, unsigned char* endaddr);
void load(unsigned char* data, unsigned int length, unsigned char* startaddr, unsigned char skipread);
void RSAinit();
int unpad();
void sha1(unsigned char *m, unsigned int len, unsigned char save);
unsigned char verifySignature(unsigned char* msg, unsigned int len, unsigned char* signature);

#endif
