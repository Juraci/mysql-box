# mysql-box

### What?

A [vagrant](http://docs.vagrantup.com/v2/why-vagrant/index.html) box that after provisioned will provide you with the following:

- a mysql-server that allows remote connections to a [specific database](https://github.com/Juraci/mysql-box/blob/master/roles/database/vars/main.yml#L3) for a [specific user](https://github.com/Juraci/mysql-box/blob/master/roles/database/vars/main.yml#L4-L5)
- it will create the database from a mysql dump file (*.sql) specified by you

### How?

To check if you have the requirements run:
```
$ bash check_requirements.sh
```

If some of the requirements fail just follow the instrucitons.

To provision just run
```
$ vagrant up db
```

It can take a while depending on your dump file.

After it finishes you can connect to the database as follows (assuming you have mysql installed):
```
$ mysql -u <your-database-user-name> -p -h 192.168.33.42
```
