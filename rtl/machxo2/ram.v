/* Verilog netlist generated by SCUBA Diamond (64-bit) 3.9.0.99.2 */
/* Module Version: 6.5 */
/* /usr/local/diamond/3.9_x64/ispfpga/bin/lin64/scuba -w -n ram -lang verilog -synth synplify -bus_exp 7 -bb -arch xo2c00 -type bram -wp 10 -rp 0011 -rdata_width 24 -data_width 24 -num_rows 1024 -byte 8 -cascade -1 -mem_init0  */
/* Sat Apr  1 13:44:25 2017 */


`timescale 1 ns / 1 ps
module ram (WrAddress, RdAddress, Data, ByteEn, WE, RdClock, RdClockEn, 
    Reset, WrClock, WrClockEn, Q)/* synthesis NGD_DRC_MASK=1 */;
    input wire [9:0] WrAddress;
    input wire [9:0] RdAddress;
    input wire [23:0] Data;
    input wire [2:0] ByteEn;
    input wire WE;
    input wire RdClock;
    input wire RdClockEn;
    input wire Reset;
    input wire WrClock;
    input wire WrClockEn;
    output wire [23:0] Q;

    wire scuba_vhi;
    wire scuba_vlo;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    defparam ram_0_0_2.INIT_DATA = "STATIC" ;
    defparam ram_0_0_2.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam ram_0_0_2.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_0_2.CSDECODE_B = "0b000" ;
    defparam ram_0_0_2.CSDECODE_A = "0b000" ;
    defparam ram_0_0_2.WRITEMODE_B = "NORMAL" ;
    defparam ram_0_0_2.WRITEMODE_A = "NORMAL" ;
    defparam ram_0_0_2.GSR = "ENABLED" ;
    defparam ram_0_0_2.RESETMODE = "ASYNC" ;
    defparam ram_0_0_2.REGMODE_B = "NOREG" ;
    defparam ram_0_0_2.REGMODE_A = "NOREG" ;
    defparam ram_0_0_2.DATA_WIDTH_B = 9 ;
    defparam ram_0_0_2.DATA_WIDTH_A = 9 ;
    DP8KC ram_0_0_2 (.DIA8(scuba_vlo), .DIA7(Data[7]), .DIA6(Data[6]), .DIA5(Data[5]), 
        .DIA4(Data[4]), .DIA3(Data[3]), .DIA2(Data[2]), .DIA1(Data[1]), 
        .DIA0(Data[0]), .ADA12(WrAddress[9]), .ADA11(WrAddress[8]), .ADA10(WrAddress[7]), 
        .ADA9(WrAddress[6]), .ADA8(WrAddress[5]), .ADA7(WrAddress[4]), .ADA6(WrAddress[3]), 
        .ADA5(WrAddress[2]), .ADA4(WrAddress[1]), .ADA3(WrAddress[0]), .ADA2(scuba_vlo), 
        .ADA1(scuba_vlo), .ADA0(ByteEn[0]), .CEA(WrClockEn), .OCEA(WrClockEn), 
        .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), .CSA1(scuba_vlo), .CSA0(scuba_vlo), 
        .RSTA(Reset), .DIB8(scuba_vlo), .DIB7(scuba_vlo), .DIB6(scuba_vlo), 
        .DIB5(scuba_vlo), .DIB4(scuba_vlo), .DIB3(scuba_vlo), .DIB2(scuba_vlo), 
        .DIB1(scuba_vlo), .DIB0(scuba_vlo), .ADB12(RdAddress[9]), .ADB11(RdAddress[8]), 
        .ADB10(RdAddress[7]), .ADB9(RdAddress[6]), .ADB8(RdAddress[5]), 
        .ADB7(RdAddress[4]), .ADB6(RdAddress[3]), .ADB5(RdAddress[2]), .ADB4(RdAddress[1]), 
        .ADB3(RdAddress[0]), .ADB2(scuba_vlo), .ADB1(scuba_vlo), .ADB0(scuba_vlo), 
        .CEB(RdClockEn), .OCEB(RdClockEn), .CLKB(RdClock), .WEB(scuba_vlo), 
        .CSB2(scuba_vlo), .CSB1(scuba_vlo), .CSB0(scuba_vlo), .RSTB(Reset), 
        .DOA8(), .DOA7(), .DOA6(), .DOA5(), .DOA4(), .DOA3(), .DOA2(), .DOA1(), 
        .DOA0(), .DOB8(), .DOB7(Q[7]), .DOB6(Q[6]), .DOB5(Q[5]), .DOB4(Q[4]), 
        .DOB3(Q[3]), .DOB2(Q[2]), .DOB1(Q[1]), .DOB0(Q[0]))
             /* synthesis MEM_LPC_FILE="ram.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    defparam ram_0_1_1.INIT_DATA = "STATIC" ;
    defparam ram_0_1_1.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam ram_0_1_1.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_1_1.CSDECODE_B = "0b000" ;
    defparam ram_0_1_1.CSDECODE_A = "0b000" ;
    defparam ram_0_1_1.WRITEMODE_B = "NORMAL" ;
    defparam ram_0_1_1.WRITEMODE_A = "NORMAL" ;
    defparam ram_0_1_1.GSR = "ENABLED" ;
    defparam ram_0_1_1.RESETMODE = "ASYNC" ;
    defparam ram_0_1_1.REGMODE_B = "NOREG" ;
    defparam ram_0_1_1.REGMODE_A = "NOREG" ;
    defparam ram_0_1_1.DATA_WIDTH_B = 9 ;
    defparam ram_0_1_1.DATA_WIDTH_A = 9 ;
    DP8KC ram_0_1_1 (.DIA8(scuba_vlo), .DIA7(Data[15]), .DIA6(Data[14]), 
        .DIA5(Data[13]), .DIA4(Data[12]), .DIA3(Data[11]), .DIA2(Data[10]), 
        .DIA1(Data[9]), .DIA0(Data[8]), .ADA12(WrAddress[9]), .ADA11(WrAddress[8]), 
        .ADA10(WrAddress[7]), .ADA9(WrAddress[6]), .ADA8(WrAddress[5]), 
        .ADA7(WrAddress[4]), .ADA6(WrAddress[3]), .ADA5(WrAddress[2]), .ADA4(WrAddress[1]), 
        .ADA3(WrAddress[0]), .ADA2(scuba_vlo), .ADA1(scuba_vlo), .ADA0(ByteEn[1]), 
        .CEA(WrClockEn), .OCEA(WrClockEn), .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(scuba_vlo), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(RdAddress[9]), .ADB11(RdAddress[8]), .ADB10(RdAddress[7]), 
        .ADB9(RdAddress[6]), .ADB8(RdAddress[5]), .ADB7(RdAddress[4]), .ADB6(RdAddress[3]), 
        .ADB5(RdAddress[2]), .ADB4(RdAddress[1]), .ADB3(RdAddress[0]), .ADB2(scuba_vlo), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA8(), .DOA7(), .DOA6(), .DOA5(), 
        .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB8(), .DOB7(Q[15]), 
        .DOB6(Q[14]), .DOB5(Q[13]), .DOB4(Q[12]), .DOB3(Q[11]), .DOB2(Q[10]), 
        .DOB1(Q[9]), .DOB0(Q[8]))
             /* synthesis MEM_LPC_FILE="ram.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    defparam ram_0_2_0.INIT_DATA = "STATIC" ;
    defparam ram_0_2_0.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam ram_0_2_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam ram_0_2_0.CSDECODE_B = "0b000" ;
    defparam ram_0_2_0.CSDECODE_A = "0b000" ;
    defparam ram_0_2_0.WRITEMODE_B = "NORMAL" ;
    defparam ram_0_2_0.WRITEMODE_A = "NORMAL" ;
    defparam ram_0_2_0.GSR = "ENABLED" ;
    defparam ram_0_2_0.RESETMODE = "ASYNC" ;
    defparam ram_0_2_0.REGMODE_B = "NOREG" ;
    defparam ram_0_2_0.REGMODE_A = "NOREG" ;
    defparam ram_0_2_0.DATA_WIDTH_B = 9 ;
    defparam ram_0_2_0.DATA_WIDTH_A = 9 ;
    DP8KC ram_0_2_0 (.DIA8(scuba_vlo), .DIA7(Data[23]), .DIA6(Data[22]), 
        .DIA5(Data[21]), .DIA4(Data[20]), .DIA3(Data[19]), .DIA2(Data[18]), 
        .DIA1(Data[17]), .DIA0(Data[16]), .ADA12(WrAddress[9]), .ADA11(WrAddress[8]), 
        .ADA10(WrAddress[7]), .ADA9(WrAddress[6]), .ADA8(WrAddress[5]), 
        .ADA7(WrAddress[4]), .ADA6(WrAddress[3]), .ADA5(WrAddress[2]), .ADA4(WrAddress[1]), 
        .ADA3(WrAddress[0]), .ADA2(scuba_vlo), .ADA1(scuba_vlo), .ADA0(ByteEn[2]), 
        .CEA(WrClockEn), .OCEA(WrClockEn), .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(scuba_vlo), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(RdAddress[9]), .ADB11(RdAddress[8]), .ADB10(RdAddress[7]), 
        .ADB9(RdAddress[6]), .ADB8(RdAddress[5]), .ADB7(RdAddress[4]), .ADB6(RdAddress[3]), 
        .ADB5(RdAddress[2]), .ADB4(RdAddress[1]), .ADB3(RdAddress[0]), .ADB2(scuba_vlo), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA8(), .DOA7(), .DOA6(), .DOA5(), 
        .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB8(), .DOB7(Q[23]), 
        .DOB6(Q[22]), .DOB5(Q[21]), .DOB4(Q[20]), .DOB3(Q[19]), .DOB2(Q[18]), 
        .DOB1(Q[17]), .DOB0(Q[16]))
             /* synthesis MEM_LPC_FILE="ram.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;



    // exemplar begin
    // exemplar attribute ram_0_0_2 MEM_LPC_FILE ram.lpc
    // exemplar attribute ram_0_0_2 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute ram_0_1_1 MEM_LPC_FILE ram.lpc
    // exemplar attribute ram_0_1_1 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute ram_0_2_0 MEM_LPC_FILE ram.lpc
    // exemplar attribute ram_0_2_0 MEM_INIT_FILE INIT_ALL_0s
    // exemplar end

endmodule
