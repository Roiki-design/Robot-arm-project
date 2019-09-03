#!/usr/bin/python2
#
# A driver for RoboDK to tranfer targets over the network and into ring buffers. hopefully. 
#
# 
#
# 
#
import sys
import zmq

def main():
    connect_to = "tcp://127.0.0.1:5555"
    topics = "'joint.0','joint.1','Joint.2','joint.3','joint.4','Joint.5','joint.6'
    if len (sys.argv) > 1:
        connect_to = sys.argv[1]
    if len (sys.argv) > 2:
        topics = sys.argv[2:]

    ctx = zmq.Context()
    s = ctx.socket(zmq.SUB)
    s.connect(connect_to)

    # manage subscriptions
    if not topics:
        print "Receiving messages on ALL topics..."
        s.setsockopt(zmq.SUBSCRIBE,'')
    else:
        print "Receiving messages from topics: %s ..." % topics
        for t in topics:
            s.setsockopt(zmq.SUBSCRIBE,t)
    try:
        while True:
            topic, msg = s.recv_multipart()
            print 'topic: %s, msg:%s' % (topic, msg)
    except KeyboardInterrupt:
        pass
    print "Done."

if __name__ == "__main__":
    main()
