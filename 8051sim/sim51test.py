from uc8051syn import eval8051

sim_inputs = {
    'ACC':0xf9, 
    'B':0, 
    'DPH':0, 
    'DPL':0, 
    'IE':0, 
    'IP':0, 
    'IRAM':[0],
    'P0':0, 
    'P1':0, 
    'P2':0, 
    'P3':0, 
    'PC':0, 
    'PCON':0, 
    'PSW':0, 
    'ROM':[0xd4],
    'SBUF':0, 
    'SCON':0, 
    'SP':0, 
    'TCON':0, 
    'TH0':0, 
    'TH1':0, 
    'TL0':0, 
    'TL1':0, 
    'TMOD':0
}


sim_outputs = {}

eval8051(sim_inputs, sim_outputs)
print sim_outputs
