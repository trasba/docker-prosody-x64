# docker-prosody-x64

clone to /opt/docker/prosody-x64 or adjust .service file

adjust the prosody.cfg.lua file in ~/.trasba/config/ 

enable service with
```sudo systemctl enable /opt/docker/prosody-x64/docker.prosody-x64.service```

relaod daemon with:
```sudo systemctl daemon-reload```

start service with:
```sudo system docker.prosody-x64 start```

nginx settings have to be made accordingly

ToDo script that automates the setup process
