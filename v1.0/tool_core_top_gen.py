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
from modport_v0p1 import *
from alpgen_v0p1 import alpgen, alpgen_json, alpgen_excel
from alpgen_util_v0p1 import alpgen_vip

# sys.path.append("./lib")
# from modport_r0p04_ing import *
# from alpgen import alpgen, alpgen_json, alpgen_excel
# from alpgen_util import alpgen_vip



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





#------------------------------------------------------------------------------
# Main - @mark
#------------------------------------------------------------------------------
if __name__ == "__main__":
    print ("===============================================")
    print (" Core Top Generator :")
    print ("===============================================")
    dict_prj = get_argument()

    from_core_gen = dict_prj['input']['tool_core_top']['json_file']
    from_tpag     = dict_prj['input']['tool_tpag']['json_file']
    cpu_irq_excel_file   = dict_prj['input']['con_info']['doc']['cpu_interrupt']['excel_file']
    cpu_irq_rtl_file = dict_prj['input']['con_info']['doc']['cpu_interrupt']['rtl_file']
    doc_main_sys  = dict_prj['input']['con_info']['doc']['main_sys']['file']
    doc_main_tie  = dict_prj['input']['con_info']['doc']['main_tie']['file']
    core_con_excel_file = dict_prj['input']['con_info']['doc']['core_connection']['excel_file']
#    list_connect  = dict_prj['input']['con_info']['connections']
    list_rtl      = dict_prj['input']['rtl']

    output_rtl    = dict_prj['output']['file']

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
    # for di in list_connect:
    #     core_top.JSON['connection'].append(di)

    # load connection doc
    sheet = pd.read_excel(cpu_irq_excel_file, sheet_name='cpu_interrupt')
    #df = pd.DataFrame(sheet).dropna(axis=0, how='any', subset=['num_soc']).fillna('')
    df = pd.DataFrame(sheet).fillna('')
    #print(df[['num_soc', 'num_cpu', 'hpdf_inst', 'hpdf_port', 'ip_inst', 'ip_port']][1:])
#    irq_table = df[['num_soc', 'num_cpu', 'name', 'hpdf_inst', 'hpdf_port', 'ip_inst', 'ip_port']][1:]
    list_irq = df[['num_cpu', 'num_soc', 'name', 'hpdf_inst', 'hpdf_port', 'ip_inst', 'ip_port']][1:].to_dict('records')
    lint_cpu_irq(list_irq)


    WriteFilePtr = open(cpu_irq_rtl_file, 'w')

    fout(ModuleStart.format('cpu_interrupt'))
    fout(PortCPU.format(MAX_CPU_IRQ-32-1))

    list_port = []
    for di in list_irq:
        #print(type(di['num_soc']))
        if int(di['num_cpu'])<32:
            continue
        name = di['name'].strip()
        if len(name)>0 and name[:1].isalpha():
            list_port.append(name)

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
    
    cpu_irq_top = modport(cpu_irq_rtl_file, [], {}, 0)

    cpu_irq_modname = 'cpu_interrupt'
    cpu_irq_instname = 'u_'+cpu_irq_modname

    core_top.add_module(cpu_irq_modname, cpu_irq_rtl_file, cpu_irq_top.get_port_list())
    core_top.add_instance(cpu_irq_instname, cpu_irq_modname, 'cpu_interrupt_')
#    exit()

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



    #--------------------------------------------------------------------------
    # load connections - core_connection
    #--------------------------------------------------------------------------
    sheet = pd.read_excel(core_con_excel_file, sheet_name='core_connections')
    df = pd.DataFrame(sheet).fillna('')
    list_con = df[['type', 'src_inst', 'src_port', 'trg_inst', 'trg_port']][2:].to_dict('records')
    for di in list_con:
        type = di['type']
        src_inst = di['src_inst']
        src_port = di['src_port']
        trg_inst = di['trg_inst']
        trg_port = di['trg_port']


        if di['type']=='pattern':
            #con = {'type':di['type'], 'mst':{'inst':di['src_inst'], 'symbol':di['src_port']}, 'slv':{'inst':di['trg_inst'], 'symbol':di['trg_port']}}
            core_top.con_pattern(src_inst, src_port, trg_inst, trg_port)
        elif di['type']=='p2p':
            flag_src, d_src = core_top.get_port_info(src_inst, src_port)
            flag_trg, d_trg = core_top.get_port_info(trg_inst, trg_port)
            # print('-----')
            # print(flag_src)
            # print(d_src)
            # print(flag_trg)
            # print(d_trg)
            if flag_src and flag_trg:
                flag_con = True
                if d_src['msb']!=d_trg['msb']:
                    flag_con = False
                if d_src['lsb']!=d_trg['lsb']:
                    flag_con = False
                if d_src['dir']==d_trg['dir']:
                    flag_con = False
            else:
                flag_con = False

            if flag_con:
                print('hit p2p')
                core_top.con_pin_to_pin(src_inst, src_port, d_src['msb'], d_src['lsb'], trg_inst, trg_port, d_trg['msb'], d_trg['lsb'])

                # flag_src = True
                # core_top.get_port_bit(src_inst, src_port)
            # print('src true')
            # else:
            #     print('src false')
            #     flag_src = False
            # if core_top.is_port(trg_inst, trg_port): flag_trg = True
            # else                                   : flag_trg = False
            
            #core_top.con_pin_to_pin(m_inst, m_port, m_msb, m_lsb, s_inst, s_port, s_msb, s_lsb)
        else:
            print('errr')
            exit()
        
        #core_top.JSON['connection'].append(con)



    # pprint(list_con)
    # exit()


    # Write RTL
    check_dir(output_rtl)
    core_top_gen = alpgen(core_top.get_json())
    core_top_gen.write_rtl(output_rtl)
