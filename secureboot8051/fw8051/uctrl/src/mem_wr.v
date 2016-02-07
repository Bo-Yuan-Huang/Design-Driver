//`include "oc8051_timesacle.v"

module mem_wr (
  clk,
  rst,
  wr,
  addr,
  data_in,
  data_out,
  ack,
  stb,
  in_addr_range,
  xram_addr,
  xram_data_out,
  xram_data_in,
  xram_ack,
  xram_stb,
  xram_wr,
  state,
  rdaddr,
  wraddr,
  len,
  step
);

input clk, rst, wr,stb;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;
output in_addr_range;

// to XRAM
output [15:0] xram_addr;
output [7:0] xram_data_out;
input [7:0] xram_data_in;
input xram_ack;
output xram_stb;
output xram_wr;

// verif output
output [1:0] state;
output [15:0] rdaddr, wraddr, len;
output step;


// FIRST ADDRESS ALLOCATED TO THIS UNIT.
localparam ADDR_START = 16'hfe40;
// see also SHA_ADDR_END.

// The addresses of the registers.
localparam REG_START   = 16'hfe40; // 1 byte
localparam REG_STATE   = 16'hfe41; // 1 byte
localparam REG_RD_ADDR = 16'hfe42; // 2 bytes
localparam REG_WR_ADDR = 16'hfe44; // 2 bytes
localparam REG_LEN     = 16'hfe46; // 2 bytes

// END OF THE ADDRESS RANGE ALLOCATED TO THIS UNIT.
localparam ADDR_END = 16'hfe50;
// see also SHA_ADDR_START.

// response to the xiommu module.
wire in_addr_range = addr >= ADDR_START && addr < ADDR_END;
wire ack = stb && in_addr_range;

// state register.
reg [1:0]  reg_state;
wire [1:0] state = reg_state;

// states
localparam STATE_IDLE       = 2'b00;
localparam STATE_READ_DATA  = 2'b01;
localparam STATE_WRITE_DATA = 2'b10;

// state predicates
wire state_idle       = reg_state == STATE_IDLE;
wire state_read_data  = reg_state == STATE_READ_DATA;
wire state_write_data = reg_state == STATE_WRITE_DATA;

// register selector predicates
wire sel_reg_start = addr == REG_START;
wire sel_reg_state = addr == REG_STATE;
wire sel_reg_rd_addr = {addr[15:1],1'b0} == REG_RD_ADDR;
wire sel_reg_wr_addr = {addr[15:1],1'b0} == REG_WR_ADDR;
wire sel_reg_len = {addr[15:1],1'b0} == REG_LEN;
wire wren = wr && state_idle;

wire start_op = sel_reg_start && data_in[0] && stb && wren;

// compute next state
wire [1:0] state_next;

wire [1:0] state_next_idle;
wire [1:0] state_next_read_data;
wire [1:0] state_next_write_data;

assign state_next = 
  state_idle       ? state_next_idle       :
  state_read_data  ? state_next_read_data  :
  state_write_data ? state_next_write_data : 2'bx;

wire step = reg_state != state_next;

// Go to the read data state if we get a start signal.  
assign state_next_idle = start_op ? STATE_READ_DATA : STATE_IDLE; 
// We will continue to be in the read data state until all the data is read.
assign state_next_read_data = read_last_byte_acked ? STATE_WRITE_DATA : STATE_READ_DATA;
// We will leave the write data state when we are finished writing into the XRAM.
assign state_next_write_data = finished    ? STATE_IDLE      :
                               more_blocks ? STATE_READ_DATA : STATE_WRITE_DATA;

// Keeping track of the current byte.
reg [4:0] byte_counter;
wire [4:0] byte_counter_next;
wire [4:0] byte_counter_next_r;
wire [4:0] byte_counter_next_w;

assign byte_counter_next_r = read_last_byte_acked ? 0                :   
                             xram_ack       ? byte_counter + 1 : byte_counter;
assign byte_counter_next_w = write_last_byte_acked ? 0                :
                             xram_ack          ? byte_counter + 1 : byte_counter;
assign byte_counter_next =
  state_idle       ? 6'b0                :
  state_read_data  ? byte_counter_next_r :
  state_write_data ? byte_counter_next_w : byte_counter;

// Keeping track of the number of bytes processed.
reg [15:0] reg_bytes_written;
wire [15:0] bytes_written_next;
assign bytes_written_next = 
  state_idle                  ? 16'b0              :
  state_write_data && xram_ack ? reg_bytes_written + 1 : reg_bytes_written;

// Keeping track of the current block.
reg [15:0] block_counter;
wire [15:0] block_counter_next;
assign block_counter_next = 
    state_idle                      ? 16'b0              : 
    state_write_data && more_blocks ? block_counter + 32 : block_counter;

// Are we reading last byte?
wire read_last_byte = (byte_counter == 5'd31) || (reg_bytes_written + byte_counter + 1 == reg_len);
wire read_last_byte_acked = read_last_byte && xram_ack;

// Writing logic.
wire writing_last_byte = (byte_counter == 5'd31) || (bytes_written_next == reg_len);
wire write_last_byte_acked = writing_last_byte && xram_ack;

// Are we done writing or do we have more blocks?
wire more_blocks = write_last_byte_acked && (bytes_written_next <  reg_len);
wire finished    = write_last_byte_acked && (bytes_written_next >= reg_len);

reg [255:0] block;
wire [255:0] block_read_data_next;

assign block_read_data_next[7   : 0   ] = byte_counter == 0  ? xram_data_in : block[7   : 0   ];
assign block_read_data_next[15  : 8   ] = byte_counter == 1  ? xram_data_in : block[15  : 8   ];
assign block_read_data_next[23  : 16  ] = byte_counter == 2  ? xram_data_in : block[23  : 16  ];
assign block_read_data_next[31  : 24  ] = byte_counter == 3  ? xram_data_in : block[31  : 24  ];
assign block_read_data_next[39  : 32  ] = byte_counter == 4  ? xram_data_in : block[39  : 32  ];
assign block_read_data_next[47  : 40  ] = byte_counter == 5  ? xram_data_in : block[47  : 40  ];
assign block_read_data_next[55  : 48  ] = byte_counter == 6  ? xram_data_in : block[55  : 48  ];
assign block_read_data_next[63  : 56  ] = byte_counter == 7  ? xram_data_in : block[63  : 56  ];
assign block_read_data_next[71  : 64  ] = byte_counter == 8  ? xram_data_in : block[71  : 64  ];
assign block_read_data_next[79  : 72  ] = byte_counter == 9  ? xram_data_in : block[79  : 72  ];
assign block_read_data_next[87  : 80  ] = byte_counter == 10 ? xram_data_in : block[87  : 80  ];
assign block_read_data_next[95  : 88  ] = byte_counter == 11 ? xram_data_in : block[95  : 88  ];
assign block_read_data_next[103 : 96  ] = byte_counter == 12 ? xram_data_in : block[103 : 96  ];
assign block_read_data_next[111 : 104 ] = byte_counter == 13 ? xram_data_in : block[111 : 104 ];
assign block_read_data_next[119 : 112 ] = byte_counter == 14 ? xram_data_in : block[119 : 112 ];
assign block_read_data_next[127 : 120 ] = byte_counter == 15 ? xram_data_in : block[127 : 120 ];
assign block_read_data_next[135 : 128 ] = byte_counter == 16 ? xram_data_in : block[135 : 128 ];
assign block_read_data_next[143 : 136 ] = byte_counter == 17 ? xram_data_in : block[143 : 136 ];
assign block_read_data_next[151 : 144 ] = byte_counter == 18 ? xram_data_in : block[151 : 144 ];
assign block_read_data_next[159 : 152 ] = byte_counter == 19 ? xram_data_in : block[159 : 152 ];
assign block_read_data_next[167 : 160 ] = byte_counter == 20 ? xram_data_in : block[167 : 160 ];
assign block_read_data_next[175 : 168 ] = byte_counter == 21 ? xram_data_in : block[175 : 168 ];
assign block_read_data_next[183 : 176 ] = byte_counter == 22 ? xram_data_in : block[183 : 176 ];
assign block_read_data_next[191 : 184 ] = byte_counter == 23 ? xram_data_in : block[191 : 184 ];
assign block_read_data_next[199 : 192 ] = byte_counter == 24 ? xram_data_in : block[199 : 192 ];
assign block_read_data_next[207 : 200 ] = byte_counter == 25 ? xram_data_in : block[207 : 200 ];
assign block_read_data_next[215 : 208 ] = byte_counter == 26 ? xram_data_in : block[215 : 208 ];
assign block_read_data_next[223 : 216 ] = byte_counter == 27 ? xram_data_in : block[223 : 216 ];
assign block_read_data_next[231 : 224 ] = byte_counter == 28 ? xram_data_in : block[231 : 224 ];
assign block_read_data_next[239 : 232 ] = byte_counter == 29 ? xram_data_in : block[239 : 232 ];
assign block_read_data_next[247 : 240 ] = byte_counter == 30 ? xram_data_in : block[247 : 240 ];
assign block_read_data_next[255 : 248 ] = byte_counter == 31 ? xram_data_in : block[255 : 248 ];

wire[255:0] block_next = state_idle      ? 256'b0               :
                         state_read_data ? block_read_data_next : block;

wire [7:0] data_out_state, data_out_rd_addr, data_out_wr_addr, data_out_len;

// allow the processor to read the current state.
assign data_out_state = {6'd0, reg_state};

wire [7:0] data_out;
assign data_out = sel_reg_state     ? data_out_state
                : sel_reg_rd_addr   ? data_out_rd_addr
                : sel_reg_wr_addr   ? data_out_wr_addr
                : sel_reg_len       ? data_out_len
                : 8'd0;

// rd address register.
wire [15:0] reg_rd_addr;
reg2byte reg_rd_addr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_rd_addr),
    .wr         (sel_reg_rd_addr && wren),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out_rd_addr),
    .reg_out    (reg_rd_addr)
);

// wr address register.
wire [15:0] reg_wr_addr;
reg2byte reg_wr_addr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_wr_addr),
    .wr         (sel_reg_wr_addr && wren),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out_wr_addr),
    .reg_out    (reg_wr_addr)
);

// length register.
wire [15:0] reg_len;
reg2byte reg_len_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_len),
    .wr         (sel_reg_len && wren),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out_len),
    .reg_out    (reg_len)
);

wire [15:0] rdaddr = reg_rd_addr;
wire [15:0] wraddr = reg_wr_addr;
wire [15:0] len = reg_len;

// XRAM interface.
assign xram_addr = state_read_data  ? reg_rd_addr + {11'b0, byte_counter} + block_counter :
                   state_write_data ? reg_wr_addr + {11'b0, byte_counter} + block_counter : 16'bx;

assign xram_data_out = 
    byte_counter == 0  ? block[7   : 0]   :
    byte_counter == 1  ? block[15  : 8]   :
    byte_counter == 2  ? block[23  : 16]  :
    byte_counter == 3  ? block[31  : 24]  :
    byte_counter == 4  ? block[39  : 32]  :
    byte_counter == 5  ? block[47  : 40]  :
    byte_counter == 6  ? block[55  : 48]  :
    byte_counter == 7  ? block[63  : 56]  :
    byte_counter == 8  ? block[71  : 64]  :
    byte_counter == 9  ? block[79  : 72]  :
    byte_counter == 10 ? block[87  : 80]  :
    byte_counter == 11 ? block[95  : 88]  :
    byte_counter == 12 ? block[103 : 96]  :
    byte_counter == 13 ? block[111 : 104] :
    byte_counter == 14 ? block[119 : 112] :
    byte_counter == 15 ? block[127 : 120] :
    byte_counter == 16 ? block[135 : 128] :
    byte_counter == 17 ? block[143 : 136] :
    byte_counter == 18 ? block[151 : 144] :
    byte_counter == 19 ? block[159 : 152] :
    byte_counter == 20 ? block[167 : 160] :
    byte_counter == 21 ? block[175 : 168] :
    byte_counter == 22 ? block[183 : 176] :
    byte_counter == 23 ? block[191 : 184] :
    byte_counter == 24 ? block[199 : 192] :
    byte_counter == 25 ? block[207 : 200] :
    byte_counter == 26 ? block[215 : 208] :
    byte_counter == 27 ? block[223 : 216] :
    byte_counter == 28 ? block[231 : 224] :
    byte_counter == 29 ? block[239 : 232] :
    byte_counter == 30 ? block[247 : 240] :
    byte_counter == 31 ? block[255 : 248] : 8'bx;

assign xram_stb = state_read_data || state_write_data;
assign xram_wr = state_write_data;

// Registers.
always @(posedge clk)
begin
    if (rst) begin
        reg_state         <= STATE_IDLE;
        byte_counter      <= 0;
        block             <= 0;
        reg_bytes_written <= 0;
        block_counter     <= 0;
    end
    else begin
        reg_state         <= state_next;
        byte_counter      <= byte_counter_next;
        block             <= block_next;
        reg_bytes_written <= bytes_written_next;
        block_counter     <= block_counter_next;
    end
end
endmodule
