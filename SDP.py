#!/bin/python

#import libraries
from scapy.all import *
import SECC.py


def SDPRequest(iface, tls=0x10):
    """
        Send SDP request Packet
        In(1): interface
        In(2): tls security level
    """
    ether=Ether()
    ip=IPv6(dst="FF02::1")
    udp=UDP(sport=50000, dport=15118)
    v2g=SECC(SECCType=0x9000, PayloadLen=2)
    payload=SECC_RequestMessage(SecurityProtocol=tls)
    packet=ether/ip/udp/v2g/payload
    r=sr1(packet, iface=iface)
    r[IPv6].src

SDPRequest($1, $2)
