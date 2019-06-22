#!/usr/bin/env python3

import time
import os
import docker 
import sys

def get_container(container_name):
    container_list = client.containers.list()
    return list(filter(lambda container: container.name == container_name, container_list))

client = docker.from_env()

target_container_name = str(sys.argv[1])

while True:

    target_container = get_container(target_container_name)
    
    if not target_container:
        print(f'No container with name { target_container_name } was found')
        break
    
    target_container = target_container[0]

    print(f'Container { target_container_name } was found, this ID is { target_container.id }')

    print(f'Container is { target_container.status }')
 
    print(f'Waiting container changed state..')
    container_changed_state = target_container.wait()
    
    if container_changed_state['Error']:
        print(f'Error { container_changed_state["Error"] } in container { target_container.name }')
        print(f'Update Job { target_container_name  } to ERROR!')
        break
    
    print(f'{ target_container.name } changed state to  with status code { container_changed_state["StatusCode"] }')
    
    print(f'Update Job { target_container_name  } to DONE!')

    time.sleep(3)

