#!/bin/bash
docker build -t comiere/dicomserver:1.0 .
docker run --privileged -v /var/run/docker.sock:/var/run/docker.sock comiere/dicomserver:1.0 &
sleep 20
xdg-open "https://localhost:8843/realms/dcm4che/protocol/openid-connect/auth?client_id=dcm4chee-arc-ui&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fdcm4chee-arc%2Fui2%2Fen%2Fstudy%2Fstudy&state=bf844c35-ca1b-4994-85f0-c6867053ced9&response_mode=fragment&response_type=code&scope=openid&nonce=99c31b07-a351-46ba-b273-b3ffe7144af2"