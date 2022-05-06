import os
#TODO: Modify syn_dir to be not the same as syn_data_dir
#TODO: Pins and nets overlap with pnr/usr_ip
#==============================================================================
# Group Objective Function or Not
#==============================================================================
group = False

#==============================================================================
# Modify for each block
#==============================================================================
lib_name    = 'poc'
blk_name    = 'ro_top'
tb_name     = ''

#=======
# Pins
#=======
lpins = [] #['VIP', 'VIN', 'VCP', 'VCN'] # Left pins
rpins = [] #['VOP', 'VON'] # Right pins
tpins = [] #['CKB']    # Top pins
bpins = []    # Bottom pins
xpins = []#['VDD', 'VSS'] # don't care pins
#======
# Nets
#======
# pos_nets = ['RO/INV1/sp', 'RO/INV2/sp', 'RO/INV3/sp', 'RO/INV4/sp', 'RO/INV5/sp', 'RO/INV6/sp', 'RO/INV7/sp', 'RO/INV8/sp', 'RO/INV9/sp', 'RO/INV10/sp', 'RO/INV11/sp', 'ctlp']    # Positive nets
# neg_nets = ['RO/INV1/sn', 'RO/INV2/sn', 'RO/INV3/sn', 'RO/INV4/sn', 'RO/INV5/sn', 'RO/INV6/sn', 'RO/INV7/sn', 'RO/INV8/sn', 'RO/INV9/sn', 'RO/INV10/sn', 'RO/INV11/sn', 'ctln']    # Negative nets
# ckp_nets = []    # Positive clock nets
# ckn_nets = []    # Negative clock nets
# clk_nets = []    # Clock nets
# sgl_nets = ['ro_out', 'RO/o1', 'RO/o2', 'RO/o3', 'RO/o4', 'RO/o5', 'RO/o6', 'RO/o7', 'RO/o8', 'RO/o9', 'RO/o10']  # Signal nets
# pwr_nets = ['VDD']
# gnd_nets = ['VSS']
# all_nets = pos_nets + neg_nets + ckp_nets + ckn_nets + clk_nets + sgl_nets
clk_nets = ['clk']    # Clock nets
# sgl_nets = ['en', 'ds', 'in', 'out', 'VNW', 'VDDPST', 'POC', 'VDDCE', 'VDDPE', 'VPW', 'VSSPST', 'VSSE']  # Signal nets
sgl_nets = ['en', 'out1', 'out2', 'out3', 'out4', 'out5', 'inv1/ds', 'inv2/ds', 'inv3/ds', 'inv4/ds', 'inv5/ds', 'VNW', 'VDDPST', 'POC', 'VDDCE', 'VDDPE', 'VPW', 'VSSPST', 'VSSE']
pwr_nets = ['VDD']
gnd_nets = ['VSS']
all_nets = clk_nets + sgl_nets + pwr_nets + gnd_nets

#==============================================================================
# Directory paths
#==============================================================================
virtuoso = '/home/pohsuan/virtuoso'
dump     = '/home/pohsuan/dump'
# Assme that project home is 2 levels up.
# input.smi must have an absolute path for setting up 'workdir'
prj_home = os.environ['ALOE_HOME']
prep_dir = os.path.join(prj_home, 'prepare')
scs_dir  = os.path.join(prep_dir, 'data')
syn_dir  = os.path.join(prj_home, 'synthesize/data')
syn_data_dir = syn_dir
lay_dir = os.path.join(prj_home, 'layout')

#==============================================================================
# Namings
#==============================================================================
RAW_STUB = '_raw'
EXT   	 = '.scs'
TB_STUB  = '_tb'

scs_raw = '{}/{}{}{}'.format(scs_dir, blk_name, RAW_STUB, EXT)
scs_cln = '{}/{}{}'.format(syn_dir, blk_name, EXT)
param   = os.path.join(syn_dir, 'input.smi')

#=========================================
# Modify for each design environment
# Each license allows 8 threads
# verify_drc can use 4 at max
#=========================================
ncpu = 1
