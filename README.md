# devtest-mongodbackup
Solution to backup a mongodb cluster. Test task, btw.
Basic setup:
1. Add external volume to store backups on host machine:

```
/home/backups/mongo:/backup
```

2. Add link to MongoDB server set up for backups.
