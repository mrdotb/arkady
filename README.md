# Arkady

Small phoenix app to show a bug with push_patch with host scope


## Setup

add to your `/etc/hosts`

```shell
127.0.0.1       arkady.local
```

open browser on http://arkady.local:4000/ trigger error
open browser on http://arkady.local:4000/no-host/ work fine
