from uc8051syn import eval8051

sim_inputs = {
    'ACC':0, 
    'PCON':0, 
    'B':0, 
    'TMOD':0, 
    'DPL':0, 
    'DPH':0, 
    'TL1':0, 
    'TL0':0, 
    'IE':0, 
    'TH1':0, 
    'TH0':0, 
    'PC':0xfffe, 
    'P2':0, 
    'P3':0, 
    'P0':0, 
    'P1':0, 
    'IRAM':[[0x10,1], [0,0], [1,0x10], 1], 
    'IP':0, 
    'TCON':0, 
    'SCON':0, 
    'SP':0, 
    'SBUF':0, 
    'opcode':0x100bc, 
    'PSW':4
}

sim_outputs = {}

eval8051(sim_inputs, sim_outputs)
print sim_outputs
