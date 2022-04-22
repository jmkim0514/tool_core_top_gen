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
from alpgen_v0p2 import alpgen, alpgen_json, alpgen_excel
from alpgen_util_v0p1 import alpgen_vip

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


# # Read HPDF Top
# #  dic_modports = {mod_name : ports[dic_port0, dic_port1, . . . ]}
# dic_modports = {}

# for mod_name in JSON_CC['core_update']['module']:
#     path = JSON_CC['core_update']['module'][mod_name]['filepath']
#     #print (mod_name)
#     #print (path)
#     # Read HPDF Top
#     new_top = modport(path, [], {}, 0)
#     list_ports = []
#     for ps in new_top.port_info_set:
#         for pi in ps:
#             dic_port = {}
#             dic_port['port'] = pi.name
#             dic_port['dir']  = pi.dir
#             dic_port['msb'] = pi.msb
#             dic_port['lsb'] = pi.lsb
#             list_ports.append(dic_port)
#     dic_modports[mod_name] = list_ports   

# # add top
# json_base.append_top_port(json_top.JSON['top']['ports'])

# # add instance
# for inst_name, dic_inst in JSON_CC['core_update']['instance'].items():
#     #print (inst_name)
#     #print (inst_dic)
#     json_base.add_instance (inst_name, dic_inst)

# # add module
# for mod_name, dic_mod in JSON_CC['core_update']['module'].items():
#     print (mod_name)
#     print (dic_mod)
#     dic_mod['ports'] = dic_modports[mod_name]
#     json_base.add_module(mod_name, dic_mod['filepath'], dic_modports[mod_name])

# # add connection
# for dic_con in JSON_CC['core_update']['connection']:
#     json_base.add_connection (dic_con)


# json_base.write_rtl('./test.v')

# def check_file(prj_i):
#     if not os.path.isdir(file_path):
#             os.makedirs(file_path)    

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
    
    # cpu_irq_top = modport(rtl_file_i, [], {}, 0)
    # cpu_irq_modname = 'cpu_interrupt'
    # cpu_irq_instname = 'u_'+cpu_irq_modname
    # core_top.add_module(cpu_irq_modname, rtl_file_i, cpu_irq_top.get_port_list())
    # core_top.add_instance(cpu_irq_instname, cpu_irq_modname, 'cpu_interrupt_')

    return list_connection

def read_excel(file_excel_i):
    list_connection = []
    list_rtl = []
    sheet = pd.read_excel(file_excel_i, sheet_name='core_connections')
    df = pd.DataFrame(sheet).dropna(axis=0, how='any', subset=['type']).fillna('')
    list_con = df[['type', 'src_inst', 'src_port', 'trg_inst', 'trg_port']][1:].to_dict('records')
    for di in list_con:
        type = di['type']
        src_inst = di['src_inst']
        src_port = di['src_port']
        trg_inst = di['trg_inst']
        trg_port = di['trg_port']

        list_connection.append(di)

    sheet = pd.read_excel(file_excel_i, sheet_name='rtl_list')
    df = pd.DataFrame(sheet).dropna(axis=0, how='any', subset=['instname']).fillna('')
    list_con = df[['instname', 'modname', 'prefix', 'file']][1:].to_dict('records')
    for di in list_con:
        list_rtl.append(di)

    return list_connection, list_rtl

def parse_port(port_i):
    if port_i.find('[')>0:
#        print('1 =====')
        port, bit = port_i.replace(']', '').split('[')
    else:
#        print('2 =====')
        port = port_i
        bit = 0

    # print(port_i)
    # print(port)
    # print(bit)
    return port, int(bit)
   
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


        # elif di['type']=='p2p':
        #     flag_src, d_src = core_top.get_port_info(src_inst, src_port)
        #     flag_trg, d_trg = core_top.get_port_info(trg_inst, trg_port)
        #     if flag_src and flag_trg:
        #         flag_con = True
        #         if d_src['msb']!=d_trg['msb']:
        #             flag_con = False
        #         if d_src['lsb']!=d_trg['lsb']:
        #             flag_con = False
        #         if d_src['dir']==d_trg['dir']:
        #             flag_con = False
        #     else:
        #         flag_con = False

        #     if flag_con:
        #         print('hit p2p')
        #         core_top.con_pin_to_pin(src_inst, src_port, d_src['msb'], d_src['lsb'], trg_inst, trg_port, d_trg['msb'], d_trg['lsb'])

        # else:
        #     print('errr')
        #     exit()




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

        obj = modport(filepath, [], {}, 0)
        ports = obj.get_port_list()
        core_top.add_instance(instname, modname, prefix)
        core_top.add_module(modname, filepath, ports)


    # peri_hpdf  = alpgen(RTL_PERI_HPDF)

    # core_top.add_module(cpu_irq.get_module())
    # core_top.add_module(cpu_irq.get_peri_hpdf())



# #    print(core_top.JSON['instance'])

# #    print(core_top.JSON['connection'])
#     core_top.con_pattern('u_peri_hpdf', '$$', '', '$$')
    #--------------------------------------------------------------------------
    # Connection
    #--------------------------------------------------------------------------

    # {port:, hpdf_inst:, hpdf_port:,}
    for di in connections_irq:
        irq_port = 'i_'+di['port'].lower()
        trg_inst = di['hpdf_inst']
        trg_port, lsb = parse_port(di['hpdf_port'])
        if core_top.is_port(trg_inst, trg_port):
            core_top.con_pin_to_pin('u_cpu_interrupt', irq_port, 0, 0, trg_inst, trg_port, lsb, lsb)
        else:
            core_top.con_pin_value('u_cpu_interrupt', irq_port, 0, 0, 0)

    # {type:, src_inst:, src_port:, trg_inst:, trg_port}
    for di in connections:
        if di['type']=='pattern':
            core_top.con_pattern(di['src_inst'], di['src_port'], di['trg_inst'], di['trg_port'])
        elif di['type']=='p2t':
            m_inst = ''
            m_port = di['trg_port']
            core_top.con_pin_value(m_inst, m_port, 299, 0, 0)

#    pprint(connections_irq)


    # todo - check
    core_top.JSON['top']['modname'] = 'core_top'

    core_top.write_rtl(OUT_CORE_TOP)

    exit()





    #--------------------------------------------------------------------------
    # read core_top from tool_core_gen
    #--------------------------------------------------------------------------
    core_top = alpgen_json(from_core_gen)
    #--------------------------------------------------------------------------
    # read pad from tool_tpag
    #--------------------------------------------------------------------------
    pad_top = alpgen_json(from_tpag)
    core_top.append_top_port(pad_top.JSON['top']['ports'])

    #--------------------------------------------------------------------------
    # load rtl from prj
    #--------------------------------------------------------------------------
    for di in list_rtl:
        new_file = di['file']
        new_instname = di['instname']
        new_modname = di['modname']
        new_top = modport(new_file, [], {}, 0)
        # get port list
        port_list_old = core_top.get_port_list(new_instname)
        port_list_new = new_top.get_port_list()
        #print('{0} ======== '.format(new_instname))

        # update old rtl
        if core_top.is_instance(new_instname, new_modname):
            # print(port_list_old)
            if check_port_a_to_b(port_list_old, port_list_new):
                #core_top.JSON['module'][new_modname]['ports'] = port_list_new
                core_top.add_module(new_modname, new_file, port_list_new)
            else:
                print('ERROR')
                exit()
        # add new rtl
        else:
            new_prefix = di['prefix']
            new_param = di['parameter']
            core_top.add_instance(new_instname, new_modname, new_prefix, new_param)
            core_top.add_module(new_modname, new_file, port_list_new)

    #--------------------------------------------------------------------------
    # load connections - cpu_interrupt
    #--------------------------------------------------------------------------


    #--------------------------------------------------------------------------
    # load connections - cpu_irq
    #--------------------------------------------------------------------------
    cpu_inst = 'u_cpu_hpdf'
    for di in list_irq:
        # print(di)
        # exit()
        src_inst = 'u_cpu_interrupt'
        src_port = 'i_'+di['name'].lower()
        trg_inst = di['hpdf_inst']
        trg_port = di['hpdf_port']
        flag_trg, d_trg = core_top.get_port_info(trg_inst, trg_port)
        # print('-----')
        # print(flag_src)
        # print(d_src)
        # print(flag_trg)
        # print(d_trg)
        if flag_trg:
            flag_con = True
            if 0!=d_trg['msb']:
                flag_con = False
            if 0!=d_trg['lsb']:
                flag_con = False
            if 'output'!=d_trg['dir']:
                flag_con = False
        else:
            flag_con = False

        if flag_con:
            core_top.con_pin_to_pin(src_inst, src_port, 0, 0, trg_inst, trg_port, 0, 0)
            #core_top.con_pin_to_pin(trg_inst, trg_port, 0, 0, src_inst, src_port, 0, 0)




        
        #core_top.JSON['connection'].append(con)



    # pprint(list_con)
    # exit()


    # Write RTL
    check_dir(output_rtl)
    core_top_gen = alpgen(core_top.get_json())
    core_top_gen.write_rtl(output_rtl)
OUT_CORE_TOP