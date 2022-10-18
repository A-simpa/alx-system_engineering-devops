#!/usr/bin/python3
"""Get Employees and their workrate using jsonplaceholder
Usage: ./1-export_to_CSV.py <employee>"""
import json
import requests
import sys

if __name__ == '__main__':
    done = 0
    userid = sys.argv[1]
    url = 'https://jsonplaceholder.typicode.com/users/'
    name = requests.get(url + userid)
    name = name.json().get('username')
    resp = requests.get(url + userid + '/todos').json()

    with open('{}.json'.format(userid), 'w') as new:
        all = []
        for task in resp:
            res = zip(("task", "completed", "username"),
                      (task.get('title'), task.get('completed'), name))
            all.append(dict(res))
        json.dump({userid: all}, new)
