import time
from random import shuffle
 
nitems=10
 
def inorder(numbs):
    for i in range(len(numbs)-1):
        if numbs[i] > numbs[i+1]: return False
    return True
 
numbs=[i for i in range(nitems)]
shuffle(numbs)
 
start=time.clock()
while not inorder(numbs):
    shuffle(numbs)
end = time.clock()
print(numbs, end-start, "seconds")

