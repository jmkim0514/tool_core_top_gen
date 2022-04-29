#!/usr/bin/env python
# coding: utf-8
#===============================================================================
#  File name   : tool_core_top_gen.py
#  Version     : v 1.0
#  Description : tool_core_top_gen
#  Simulator   : Python 3
#  Created by  : Kim jong-min
#  Date        : 2022/03/14     1'st Release
#===============================================================================
#  History
#-------------------------------------------------------------------------------
# 2022-03-14 Jongmin-Kim    1st Release
#===============================================================================
import os
import sys
import copy
import json
import argparse
import pandas as pd
from pprint import pprint
sys.path.append("../../lib/")
from modport_v0p2 import *
from alpgen_v0p3 import alpgen, alpgen_json, alpgen_excel
#from alpgen_util_v0p1 import alpgen_vip

# sys.path.append("./lib")
# from modport_r0p04_ing import *
# from alpgen import alpgen, alpgen_json, alpgen_excel
# from alpgen_util import alpgen_vip

WriteFilePtr = ''

#------------------------------------------------------------------------------
# Function - @mark
#------------------------------------------------------------------------------
def get_argument():
    parser = argparse.ArgumentParser(description="tool_core_top_gen: core_top Generator. (jimmy@alpha-holdings.co.kr)")
    parser.add_argument('-p', dest="prj_file", required=True, help="project file")
    args = parser.parse_args()

    if os.path.isfile(args.prj_file)==False:
        print ("[LOG] *E, Can not find input file = ", args.prj_file)
        exit()

    return get_json_data(args.prj_file)

def get_json_data(config_path: str):
    with open(config_path, 'r', encoding='utf-8') as f:
        contents = f.read()
        #print (contents)
        while "/*" in contents:
            preComment, postComment = contents.split('/*', 1)
            contents = preComment + postComment.split('*/', 1)[1]
        while "//" in contents:
            preComment, postComment = contents.split('//', 1)
            contents = preComment + '\n' + postComment.split('\n', 1)[1]
        return json.loads(contents.replace("'", '"'))

def check_dir(file_path_i):
    file_path = os.path.dirname(file_path_i)
    if not os.path.isdir(file_path):
        os.makedirs(file_path)


def cnv_port_list_to_dict(list_port_i):
    result = {}
    for di in list_port_i:
        result[di['port']] = di
    return result

def check_port_a_to_b(list_core_top_i, list_hpdf_i):
    #dict_core_top = cnv_port_list_to_dict(list_core_top_i)
    dict_hpdf = cnv_port_list_to_dict(list_hpdf_i)
    for di in list_core_top_i:
        port_name = di['port']
        if dict_hpdf.get(port_name)==None:
            print('[ERROR] port miss match')
            print(port_name)
            exit()
        else:
            if di!=dict_hpdf[port_name]:
                print('[ERROR] port option is diff')
                exit()
    return True


DISPLAY_TO_CONSOLE = False
MAX_CPU_IRQ = 512

def fout(i_str):
    global WriteFilePtr
    if DISPLAY_TO_CONSOLE: print(i_str)
    WriteFilePtr.write(i_str+"\n")

ModuleStart = """\
module {0} (\
"""
PortCPU = """\
    // CPU Interrupt
    output wire [{0}:0] o_soc_irq,
    // Interrupt Source\
"""
PortIrq = """\
    input  wire         i_{0}{1}\
"""
PortEnd = """\
);
"""
AssignIrq = """\
    assign  o_soc_irq[{0}] = i_{1};\
"""

AssignTie = """\
    assign  o_soc_irq[{0}] = 1'b0;\
"""


ModuleEnd = """\
endmodule
"""

def lint_cpu_irq(list_irq_i):
    #print(dict_irq_i)
    for n, di in enumerate(list_irq_i):
        di['name'] = di['name'].strip()
        if n!=di['num_cpu']:
            print('[ERROR] *E, num_cpu number error')
            print('[ERROR]     - n = '+str(n))
            print('[ERROR]     - cpu_num = '+str(di['num_cpu']))
            exit()
        if n>31 and n!=(di['num_soc']+32):
            print('[ERROR] *E, num_soc number error')
            print('[ERROR]     - cpu_num = '+str(n))
            print('[ERROR]     - soc_num = '+str(di['num_soc']))
            exit()
        if n>(MAX_CPU_IRQ-1):
            print('[ERROR] *E, over max irq error')
            print('[ERROR]     - cpu_num = '+str(n))
            print('[ERROR]     - max irq = '+str(MAX_CPU_IRQ-1))
            exit()
        if di['name'].find('[')>0 or di['name'].find(']')>0:
            print('[ERROR] *E, Signal name must not contain braket("[" or" "]") characters.')
            print('[ERROR]     - cpu num = '+str(n))
            print('[ERROR]     - name = '+di['name'])
            exit()
        if di['name'].find(' ')>-1:
            print('[ERROR] *E, Signal name must not contain space(" ") characters.')
            print('[ERROR]     - cpu num = '+str(n))
            print('[ERROR]     - name = '+di['name'])
            exit()
        if di['name'][:1].isalpha() and di['name'].find('-')>-1:
            print('[ERROR] *E, Signal name must not contain dash("-") characters.')
            print('[ERROR]     - cpu num = '+str(n))
            print('[ERROR]     - name = '+di['name'])
            exit()

        if di['name']=='-' or di['name'].isspace():
            continue
        for dj in list_irq_i[n+1:]:
            if dj['name'].startswith('-') or dj['name']=='':
                continue

            if di['name']==dj['name']:
                print('[ERROR] *E, Duplicate Signal names')
                print('[ERROR]     - cpu_num = '+str(di['num_cpu']))
                print('[ERROR]     - name    = '+di['name'])
                print('[ERROR]     - cpu_num = '+str(dj['num_cpu']))
                print('[ERROR]     - name    = '+dj['name'])
                exit()

def gen_cpu_interrupt(excel_file_i, rtl_file_i):
    global WriteFilePtr
    # load connection doc
    sheet = pd.read_excel(excel_file_i, sheet_name='cpu_interrupt')
    #df = pd.DataFrame(sheet).dropna(axis=0, how='any', subset=['num_soc']).fillna('')
    df = pd.DataFrame(sheet).fillna('')
    #print(df[['num_soc', 'num_cpu', 'hpdf_inst', 'hpdf_port', 'ip_inst', 'ip_port']][1:])
#    irq_table = df[['num_soc', 'num_cpu', 'name', 'hpdf_inst', 'hpdf_port', 'ip_inst', 'ip_port']][1:]
    list_irq = df[['num_cpu', 'num_soc', 'name', 'hpdf_inst', 'hpdf_port', 'ip_inst', 'ip_port']][1:].to_dict('records')
    lint_cpu_irq(list_irq)

    list_connection = []

    WriteFilePtr = open(rtl_file_i, 'w')

    fout(ModuleStart.format('cpu_interrupt'))
    fout(PortCPU.format(MAX_CPU_IRQ-32-1))

    list_port = []
    for di in list_irq:
        if int(di['num_cpu'])<32:
            continue
        name = di['name'].strip()
        hpdf_inst = di['hpdf_inst'].strip()
        hpdf_port = di['hpdf_port'].strip()
        if len(name)>0 and name[:1].isalpha():
            list_port.append(name)

        if len(name)>0 and len(hpdf_inst)>0 and len(hpdf_port)>0:
            dict_tmp = {}
            dict_tmp['port'] = name
            dict_tmp['hpdf_inst'] = hpdf_inst
            dict_tmp['hpdf_port'] = hpdf_port
            list_connection.append(dict_tmp)

    for n, name in enumerate(list_port):
        if n==(len(list_port)-1): last_comma = ''
        else                    : last_comma = ','
        fout(PortIrq.format(name.lower(), last_comma))

    fout(PortEnd)

    # Assign
    for di in list_irq:
        num = di['num_soc']
        if num=='':
            continue
        name = di['name'].strip()
        if len(name)>0 and name[:1].isalpha():
            fout(AssignIrq.format(num, name.lower()))
        else:
            fout(AssignTie.format(num))

    fout(ModuleEnd)
    WriteFilePtr.close()    
    
    return list_connection

def read_excel(file_excel_i):
    list_connection = []
    list_rtl = []
    sheet = pd.read_excel(file_excel_i, sheet_name='core_connections')
    df = pd.DataFrame(sheet).dropna(axis=0, how='any', subset=['type']).fillna('')
    list_con = df[['type', 'mst_inst', 'mst_port', 'slv_inst', 'slv_port']][1:].to_dict('records')
    for di in list_con:
        if type(di['type']     )==str: di['type']      = di['type'].strip()
        if type(di['mst_inst'] )==str: di['mst_inst']  = di['mst_inst'].strip()
        if type(di['mst_port'] )==str: di['mst_port']  = di['mst_port'].strip()
        if type(di['slv_inst'] )==str: di['slv_inst']  = di['slv_inst'].strip()
        if type(di['slv_port'] )==str: di['slv_port']  = di['slv_port'].strip()
        list_connection.append(di)

    sheet = pd.read_excel(file_excel_i, sheet_name='rtl_list')
    df = pd.DataFrame(sheet).dropna(axis=0, how='any', subset=['instname']).fillna('')
    list_con = df[['instname', 'modname', 'prefix', 'file', 'parameter']][1:].to_dict('records')
    for di in list_con:
        list_rtl.append(di)

    return list_connection, list_rtl

def split_irq_port(port_i):
    """split port and bit
    Args:
        port_i (str): port name (e.g., irq[4])
    Returns:
        (list): (e.g., irq, 4)
    """
    if port_i.find('[')>0:
        port, bit = port_i.replace(']', '').split('[')
    else:
        port = port_i
        bit = 0

    return port.strip(), int(bit)

def get_port_info(obj_i, inst_i, port_i):
    """get port info
    Args:
        obj_i (object) : alpgen object
        inst_i (str) : instance name
        port_i (str) : port name
    Returns:
        (dict): {inst: inst_name, port: port_name, msb:0, lsb:0}
    """
    if port_i.find('[')>0:
        s = port_i.find('[')
        e = port_i.find(']')
        m = port_i.find(':')
        if m>0:
            msb, lsb = port_i[s+1:e].split(':')
            msb = int(msb.strip())
            lsb = int(lsb.strip())
        else:
            msb = int(port_i[s+1:e].strip())
            lsb = msb

        port = port_i[:s].strip()

        return {'inst': inst_i, 'port':port, 'msb': msb, 'lsb': lsb}
    else:
        flag, dict_port = obj_i.get_port_info(inst_i, port_i)
        if flag:
            msb = dict_port['msb']
            lsb = dict_port['lsb']
            return {'inst': inst_i, 'port': port_i, 'msb': msb, 'lsb': lsb}
        else:
            return None

#------------------------------------------------------------------------------
# Main - @mark
#------------------------------------------------------------------------------
if __name__ == "__main__":
    print ("===============================================")
    print (" Core Top Generator :")
    print ("===============================================")
    dict_prj = get_argument()

    IN_CORE_TOP = dict_prj['input']['core_top']
#    IN_RTL_LIST = dict_prj['input']['rtl']
    
    IN_CPU_IRQ_EXCEL = dict_prj['cpu_interrupt']['input_excel']
    OUT_CPU_IRQ_RTL = dict_prj['cpu_interrupt']['output_rtl']

    OUT_CORE_TOP = dict_prj['output']['core_top']
    CONNECTION_EXCEL = dict_prj['connection']

    #--------------------------------------------------------------------------
    # load connections - core_connection
    #--------------------------------------------------------------------------
    connections, rtl_list = read_excel(CONNECTION_EXCEL)

    # generate cpu_interrupt.v
    check_dir(OUT_CPU_IRQ_RTL)
    connections_irq = gen_cpu_interrupt(IN_CPU_IRQ_EXCEL, OUT_CPU_IRQ_RTL)

    # alpgen object
    core_top = alpgen(IN_CORE_TOP)
    cpu_irq  = alpgen(OUT_CPU_IRQ_RTL)

    # add cpu_interrupt
    modname = 'cpu_interrupt'
    instname = 'u_'+modname
    prefix = 'irq_'
    ports = cpu_irq.get_port_list()

    core_top.add_instance(instname, modname, prefix)
    core_top.add_module(modname, modname+'.v', ports)

    # add RTL_LIST
    for di in rtl_list:
        instname = di['instname']
        modname = di['modname']
        prefix = di['prefix']
        filepath = di['file']
        parameter = di['parameter'].strip()
        if len(parameter)>0:
            try:
                parameter = parameter.replace(chr(8220), '"')   # for ooffice
                parameter = parameter.replace(chr(8221), '"')   # for ooffice
                param = eval(parameter)
            except:
                assert(0), '[ERROR] parameter do not supported = '+parameter
        else:
            param = {}

        obj = modport(filepath, [], param, 0)
        ports = obj.get_port_list()
        core_top.add_instance(instname, modname, prefix, param)
        core_top.add_module(modname, filepath, ports)

    core_top.platform_designer()
    core_top.set_bus_group()


    #--------------------------------------------------------------------------
    # Connection
    #--------------------------------------------------------------------------

    # {port:, hpdf_inst:, hpdf_port:,}
    for di in connections_irq:
        irq_port = 'i_'+di['port'].lower()
        slv_inst = di['hpdf_inst']
        slv_port, lsb = split_irq_port(di['hpdf_port'])
        if core_top.is_port(slv_inst, slv_port):
            core_top.con_pin_to_pin('u_cpu_interrupt', irq_port, 0, 0, slv_inst, slv_port, lsb, lsb)
        else:
            core_top.con_pin_value('u_cpu_interrupt', irq_port, 0, 0, 0)

    # {type:, mst_inst:, mst_port:, slv_inst:, slv_port}
    for di in connections:
        mst_inst = di['mst_inst']
        mst_port = di['mst_port']
        slv_inst = di['slv_inst']
        slv_port = di['slv_port']

        if di['type']=='pattern':
            core_top.con_pattern(di['mst_inst'], di['mst_port'], di['slv_inst'], di['slv_port'])
        elif di['type']=='p2t':
            core_top.con_pin_value(mst_inst, mst_port, 299, 0, 0)
        elif di['type']=='p2p':
            mst_info = get_port_info(core_top, mst_inst, mst_port)
            slv_info = get_port_info(core_top, slv_inst, slv_port)
            core_top.con_pin_to_pin(mst_info['inst'], mst_info['port'], mst_info['msb'], mst_info['lsb'], \
                                    slv_info['inst'], slv_info['port'], slv_info['msb'], slv_info['lsb'])
        elif di['type']=='tie':
            if slv_inst:
                print('[LOG] In type==tie mode, "slave instance" must be empty in {0}'.format(CONNECTION_EXCEL))
                print('[LOG] - slave instance = {0}'.format(di['slv_inst']))
                exit()

            mst_info = get_port_info(core_top, mst_inst, mst_port)
            if mst_info==None:
                print('[LOG] Error-1234, can not find port name')
                print('[LOG] - instance name = ', mst_inst)
                print('[LOG] - port name = ', mst_port)
                exit()
            else:
                core_top.con_pin_value(mst_info['inst'], mst_info['port'], mst_info['msb'], mst_info['lsb'], slv_port)

        elif di['type']=='alp_vip':
            
            #                   (bus_inst, bus_sym , vip_inst, clk_inst, clk_port, rst_inst, rst_port, pre_i=None):
            core_top.con_alp_vip(mst_inst, mst_port, slv_inst, None, None, None, None, None)
        elif di['type']=='bus_group':
            #                      mst_inst, mst_symbol,  slv_inst, slv_symbol
            core_top.con_bus_group(mst_inst, mst_port  ,  slv_inst, slv_port  )


    core_top.JSON['top']['modname'] = 'core_top'
    core_top.write_rtl(OUT_CORE_TOP)
