#!/usr/bin/python2
#
# A driver for RoboDK to tranfer targets over the network and into ring buffers. hopefully. 
#
# 
#
# 
#
from twisted.internet import protocol, reactor, endpoints
From machinekit import hal

class RobotControl(protocol.Protocol):
    def dataReceived(self, data):
        print(data)

class RobotFactory(protocol.Factory):
    def buildProtocol(self, addr):
        return RobotControl()

endpoint = TCP4ServerEndpoint(reactor, 8007)
endpoint.listen(robotFactory())
reactor.run()
