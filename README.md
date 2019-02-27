# fractal-docker



## Docker

1. ```docker build -t my_fractal .```
2. ```docker container run -p 3000:3000 my_fractal```
3. ```docker run -d my_fractal tail -f /dev/null```



---

## Possible Errors:
---

#### PROBLEM 1:
```
Building fractal
Step 1/8 : FROM node:10-alpine
 ---> fe6ff768f798
Step 2/8 : RUN apk add dos2unix
 ---> Running in 3ee88c748de6
fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/community/x86_64/APKINDEX.tar.gz
ERROR: http://dl-cdn.alpinelinux.org/alpine/v3.8/main: temporary error (try again later)
WARNING: Ignoring APKINDEX.adfa7ceb.tar.gz: No such file or directory
ERROR: http://dl-cdn.alpinelinux.org/alpine/v3.8/community: temporary error (try again later)
WARNING: Ignoring APKINDEX.efaa1f73.tar.gz: No such file or directory
ERROR: unsatisfiable constraints:
  dos2unix (missing):
    required by: world[dos2unix]
ERROR: Service 'fractal' failed to build: The command '/bin/sh -c apk add dos2unix' returned a non-zero code: 1`
```

#### SOLUTION:
Docker Settings > Network > set fixed DNS 8.8.8.8