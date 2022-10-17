#!/usr/bin/python3
"""Get Employees and their workrate using jsonplaceholder"""

import requests
import sys


def main():
    complete_count, userId = 0, int(sys.argv[1])
    start = (userId - 1) * 20
    end = userId * 20
    name = requests.get(f'https://jsonplaceholder.typicode.com/users/{userId}')
    name = name.json()['name']
    resp = requests.get(f'https://jsonplaceholder.typicode.com/todos').json()
    resp = resp[start:end]

    for task in resp:
        if (task['completed']):
            complete_count += 1

    print(f'Employee {name} is done with tasks({complete_count}/20)')
    for task in resp:
        if (task['completed']):
            print(f'\t {task["title"]}')


if __name__ == '__main__':
    main()
