#!/usr/bin/python3
"""Get Employees and their workrate using jsonplaceholder
Usage: ./1-export_to_CSV.py <employee>"""
import csv
import requests
import sys

if __name__ == '__main__':
    done = 0
    userid = sys.argv[1]
    url = 'https://jsonplaceholder.typicode.com/users/'
    name = requests.get(url + userid)
    name = name.json().get('username')
    resp = requests.get(url + userid + '/todos').json()

    with open('{}.csv'.format(userid), 'w') as new:
        new_file = csv.writer(new, delimiter=",")
        for task in resp:
            res = [userid, name]
            res = res + [task.get('completed'), task.get('title')]
            new_file.writerow(res)
