#! /usr/bin/python

f1 = open('hosts1', "r")
f2 = open('/home/ubuntu/k8s/k8s-cluster-updated/hosts', "w")
masters_count = 0
workers_count = 0
for line in f1:
    if (line[0] ==  'm') :
        masters_count += 1
        line1='['+line.rstrip('\n')+']'+'\n'
        f2.write(line1)
    elif (line[0] ==  'w') :
        masters_count = 0
        workers_count += 1
        line1='['+line.rstrip('\n')+']'+'\n'
        f2.write(line1)
    elif (masters_count > 0):
        masters_count += 1
        line1='master ansible_host='+line.rstrip('\n')+' ansible_user=ubuntu'+'\n'
        f2.write(line1)
    else : 
        line1='worker'+str(workers_count)+' ansible_host='+line.rstrip('\n')+' ansible_user=ubuntu'+'\n'
        f2.write(line1)        
        workers_count += 1
f2.write('[all:vars]\n')
f2.write('ansible_python_interpreter=/usr/bin/python3')    
f1.close()
f2.close()
