#!/usr/bin/python3
"""Get Employees and their workrate using jsonplaceholder
Usage: ./1-export_to_CSV.py <employee>"""
import json
import requests
import sys

if __name__ == '__main__':
    done = 0
    url = 'https://jsonplaceholder.typicode.com/users/'
    users = requests.get(url).json()
    every = {}
    for user in users:
        name = user.get('username')
        userid = str(user.get('id'))
        resp = requests.get(url + userid + '/todos').json()
        all = []
        for task in resp:
            res = zip(("username", "task", "completed"),
                      (name, task.get('title'), task.get('completed')))
            all.append(dict(res))
        every[userid] = all

    with open('todo_all_employees.json', 'w') as new:
        json.dump(every, new)
