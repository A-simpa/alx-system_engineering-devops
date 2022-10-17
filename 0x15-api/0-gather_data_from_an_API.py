#!/usr/bin/python3
"""Get Employees and their workrate using jsonplaceholder
Usage: ./0-gather_data_from_an_API.py <employee>"""
import requests
import sys

if __name__ == '__main__':
    done = 0
    userid = sys.argv[1]
    start = (int(userid) - 1) * 20
    end = int(userid) * 20
    name = requests.get('https://jsonplaceholder.typicode.com/users/' + userid)
    name = name.json().get('name')
    resp = requests.get('https://jsonplaceholder.typicode.com/todos').json()
    resp = resp[start:end]

    for task in resp:
        if (task.get('completed')):
            done += 1

    print('Employee {} is done with tasks({}/20)'.format(name, done))
    for task in resp:
        if (task.get('completed')):
            print('\t {}'.format(task.get('title')))
