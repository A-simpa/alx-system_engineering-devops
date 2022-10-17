#!/usr/bin/python3
"""Get Employees and their workrate using jsonplaceholder"""

import requests
import sys


def main():
    done, userId = 0, sys.argv[1]
    start = (int(userId) - 1) * 20
    end = int(userId) * 20
    name = requests.get('https://jsonplaceholder.typicode.com/users/' + userId)
    name = name.json()['name']
    resp = requests.get(f'https://jsonplaceholder.typicode.com/todos').json()
    resp = resp[start:end]

    for task in resp:
        if (task['completed']):
            done += 1

    print('Employee {} is done with tasks({}/20)'.format(name, done))
    for task in resp:
        if (task['completed']):
            print('\t {}'.format(task['title']))


if __name__ == '__main__':
    main()
