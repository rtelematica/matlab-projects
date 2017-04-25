NUMA=[ 1 0 0 0 -1]
DENA=[1 0 0]
[ p z k]=tf2zpk(DENA,NUMA)
zplane(z,p)