#include "rsa.h"

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
#ifdef CBMC
#define MAX_PRG_SIZE 50
#define MAX_IM_SIZE  100
#else
#define MAX_PRG_SIZE 0x5000
#define MAX_IM_SIZE  0x2000
#endif

XDATA_ARR(0x0000, MAX_PRG_SIZE, unsigned char, program);
XDATA_ARR(0x5000, MAX_IM_SIZE, unsigned char, boot);

XDATA_ARR(0xC000, MAX_PRG_SIZE+0x40, unsigned char, sha_in);
XDATA_ARR(0xE100, H, unsigned char, sha_out);
XDATA_ARR(0xE200, N, unsigned char, rsa_out);

/*---------------------------------------------------------------------------*/
#ifdef C
#define PACK(var, size)
#else
#define PACK(var, size) unsigned char var[size]
#endif

struct modules{
    unsigned int addr;
    PACK(p0,2);  // add extra bytes to account for different type sizes
    unsigned int size;
    PACK(p1,2);
    unsigned char hash[H];
};
struct image{
    unsigned char sig[N];  // signature of header
    unsigned char exp[N];
    unsigned char mod[N];  // n in modexp
    unsigned int num;      // total number of blocks
    PACK(p0, 2);
    struct modules module[1];
};

enum status{
    UNDET,
    FAIL,
    PASS
};

//public key hash
CODE unsigned char pkhash[20] = {0x37, 0x34, 0xA6, 0x83, 
				   0x5F, 0xFC, 0xE0, 0x2B, 
				   0xC6, 0xEE, 0xCB, 0x81, 
				   0x6C, 0x92, 0x6C, 0x7C, 
				   0xBA, 0x79, 0xCB, 0x8F};

#ifndef C
void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}
#endif

void fail(unsigned char* failmes) {
#ifdef C
  printf("%s\n", failmes);
#else
  (void)failmes;
  P0 = 0;
  quit();
#endif
}

#ifdef CBMC
void makeimage(unsigned char* arr)
{
    gen(arr, MAX_IM_SIZE);
/*
    unsigned int num;
    struct modules *block = ((struct image*)arr)->module;
    unsigned char* moddata;
    unsigned int total = 0;
    unsigned int i;
    unsigned int size;

    gen(arr+N, sizeof(struct image)-N); // keys and number of modules, first module
    num = ((struct image*)arr)->num & 0xFFFF;
    if(num > (MAX_IM_SIZE - 3*N - sizeof(unsigned int))/sizeof(struct modules)+1)
    {
	sig_val = 0;
	gen(arr+ sizeof(struct image), MAX_IM_SIZE - sizeof(struct image)); // remaining modules
	gen(arr, N);
    }
    else
    {
	gen(arr + sizeof(struct image), (num-1)*sizeof(struct modules)); // remaining modules

	moddata = (unsigned char*)(block + num); // program data of this module
	for(i=0; i<num; i++)
	{
	    unsigned int ldaddr;
	    // check that size and address are valid
	    size = block->size & 0xFFFF;     // size of current module
	    ldaddr = block->addr;   // address to load this module into
	    if(moddata + total + size > arr + MAX_IM_SIZE ||// the data fits inside the image
	       moddata + total + size < moddata + total)  // overflow
	    {
		sig_val = 0;
		break;
	    }
	    else if(ldaddr + size > MAX_PRG_SIZE || ldaddr + size < ldaddr)
		addr_val = 0;
	    
	    total += size;
	    block++;
	}
	gen(moddata, total);
	uninterp_sha(arr+N, moddata + total - arr - N, arr, 1);
	//uninterp_rsa(arr,
    }
*/
}
#endif

void main() {
    unsigned int i, j;
    int num;   // total number of blocks
    struct image* im;
    struct modules* block; // current block
    unsigned int size;
    unsigned char* moddata;
    enum status pass = UNDET;

#ifdef CBMC
    unsigned char before, after;
    const unsigned int compind = nondet_uint()%MAX_IM_SIZE;
    // is the image valid?
    sig_val = 1;
#endif

#ifndef C
    // for now, just allow reading everywhere
    for(i=0; i<32; i++)
	pt_rden[i] = 0xFF;
#endif   

    // STAGE 0: set up
#ifdef C
    // put new arrays into pt
    pt.start[6] = boot;
    pt.end[6] = boot+MAX_IM_SIZE;
    pt.start[7] = program;
    pt.end[7] = program+MAX_PRG_SIZE;
    pt.start[8] = sha_in;
    pt.end[8] = (unsigned char*)(&sha_in+1);
    pt.start[9] = sha_out;
    pt.end[9] = sha_out+H;
    pt.start[10] = rsa_out;
    pt.end[10] = rsa_out+N;
    //for(i=0; i<11; i++)
    //printf("%p, %p\n",pt.start[i], pt.end[i]);
#endif

    // set SHA read and write addresses
    unlock_wr((unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    sha_regs.rd_addr = sha_in;
    sha_regs.wr_addr = sha_out;
    lock_wr((unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    // unlock memwr registers
    unlock_wr((unsigned char*)&memwr_regs.start, (unsigned char*)(&memwr_regs.len+1));
    // set up RSA
    unlock_wr((unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));
    rsa_regs.opaddr = rsa_out;  // set up address to write to
    lock_wr((unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));
    RSAinit();

    // STAGE 1: read image into RAM  
    unlock_wr(boot, boot+MAX_IM_SIZE);
    load(0, MAX_IM_SIZE, boot, 1);

    // image is loaded.
    // now we need to lock boot to boot + MAX_IM_SIZE
    lock_wr(boot, boot+MAX_IM_SIZE);
#ifdef CBMC
    before = boot[compind];
    if(nondet_uint())
	writec(nondet_uint(), nondet_uchar());
    after = boot[compind];
    assert(before==after);
#endif
    im  = (struct image*) boot;
    num = im->num & 0xFFFF;  // number of modules
    // sizeof image struct includes extra signature and first module
    size = sizeof(struct image) - (im->exp -(unsigned char*)im) + sizeof(struct modules) * (num-1);
    if(size > MAX_IM_SIZE)
    {
	pass = FAIL; // FAIL: image too large
	fail("header too large");
	return;
    }

    // STAGE 2: check that key matches hash
    sha1(im->exp, 512, 1);
    for(i=0; i<H; i++){
	if(sha_out[i] != pkhash[i]){
	    pass = FAIL;  // FAIL: key hash mismatch
	    fail("key hash mismatch");
	    return;
	}
    }

    // set signature key
    //load(im->exp, N, (unsigned int)rsa_regs.exp, 0);
    unlock_wr(rsa_regs.exp, rsa_regs.exp+N);
    for(i=0; i<N; i++)
	rsa_regs.exp[i] = im->exp[i];

    lock_wr(rsa_regs.exp, rsa_regs.exp+N);

    // set signature modulus
    //load(im->mod, N, (unsigned int)rsa_regs.n, 0);
    unlock_wr(rsa_regs.n, rsa_regs.n+N);
    for(i=0; i<N; i++)
	rsa_regs.n[i] = im->mod[i];
    lock_wr(rsa_regs.n, rsa_regs.n+N);

    // STAGE 3: verify signature in boot
    if(!verifySignature(im->exp, size, im->sig))
    {
	pass = FAIL;  // FAIL: signature mismatch
	fail("signature mismatch");
	return;
    }

    // STAGE 4: load blocks
    unlock_wr(program, program + MAX_PRG_SIZE);  // unlock memory space for program
    block = im->module;  // block data in header
    moddata = (unsigned char*)(block + num); // program data of this module

    for(i=0; i<num; i++)
    {
        unsigned int ldaddr;
	// check that size and address are valid
	size = block->size & 0xFFFF;     // size of current module
	ldaddr = block->addr;   // address to load this module into
	if(moddata + size > boot + MAX_IM_SIZE ||// the data fits inside the image
	   moddata + size < moddata)  // overflow
	{
	    pass = FAIL;
	    fail("data does not fit in image");
	    return;
	}
	if(size + ldaddr > MAX_PRG_SIZE ||// the data fits in memory range allocated for it
	   ldaddr + size < ldaddr)
	{
	    pass = FAIL;
	    fail("program write out of range");
	    return;
	}

	// load data
	load(moddata, size, program+ldaddr, 0);

	// update to next module
	moddata += size;
	block++;
    }

    // lock newly loaded data
    lock_wr(program, program + MAX_PRG_SIZE);

    block = im->module;  // go back to first module
    moddata = (unsigned char*)(block + num); // program data of this module

    for(i=0; i<num; i++)
    {
        unsigned int ldaddr;
	// check that size and address are valid
	size = block->size & 0xFFFF;     // size of current module
	ldaddr = block->addr;   // address to load this module into

	// check module hash
	sha1(program+ldaddr, size, 1);
	for(j=0; j<H; j++){
	    if(sha_out[j] != block->hash[j]){
		pass = FAIL;
		fail("module hash mismatch");
		return;
	    }
	}
	// update to next module
	moddata += size;
	block++;
    }
/*
    // check that program loaded correctly, for testing only
    for(i=0; i<moddata-(unsigned char*)block; i++){
	P0 = program[i];
	if(program[i] != *((unsigned char*)block + i)){
	    pass = FAIL;  // FAIL
	    fail("load is wrong");
	    break;
	}
    }
    // PASS or FAIL
    if(pass != FAIL)
*/
    pass = PASS;
    //unlock_wr(boot, boot+MAX_IM_SIZE);
    //unlock_wr((unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.rd_addr+1));
    //unlock_wr((unsigned char*)&sha_regs.wr_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    //unlock_wr((unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));

    P0 = pass;

#ifdef CBMC
    after = boot[compind];
    assert(after==before);
#endif
#ifdef C
    printf("pass: %d\n", pass);
#else
    quit();
#endif
}

