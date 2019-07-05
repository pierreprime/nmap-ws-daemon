# nmap websocket daemon

The goal of this repo is to experiment :
* nmap running in background, making initial map of network then logging changes with ndiff
* convert these XML outputs into JSON in compliance with a JSON schema
* send initial JSON and diff JSON to a Websocket client

## nmap script

1) Make bash nmap script with XML output (including ndiff)
2) Give it websockets connectivity

## towards nmap JSON schema

1) Test convert official DTD to XSD format
2) Test convert XSD to JSON schema using xsd2json
3) Double check this JSON schema by
    * Manually decoding nmap DTD
    * Make it a hand-crafted JSON schema to check against
4) Convert nmap XML output to JSON with xml2json
5) Check obtained JSON against JSON schemas

## steps

Initial nmap run >> XML output >> xml2json >> check against JSON schema(s)
Incremental ndiff run >> XML output >> xml2json >> check against JSON schema sub-part (later)

Event-driven application (Symfony event ? Node ?) will format this nmap JSON into game objects for client
This application will listen for game commands from client and translate it back into shell / nmap commands
Probably in separate repository
