def rotX(th): return matrix([[1,0,0],[0,cos(th),-sin(th)],[0,sin(th),cos(th)]])
def rotY(th): return matrix([[cos(th),0,sin(th)],[0,1,0],[-sin(th),0,cos(th)]])
def rotZ(th): return matrix([[cos(th),-sin(th),0],[sin(th),cos(th),0],[0,0,1]])
