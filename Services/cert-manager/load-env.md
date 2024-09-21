# Load-env Script
`./load-env.sh .env envsubst < ACME.yml | kubectl apply -f -`
- Loads environments from the file that is sent as an argument. In the case of the example above, `.env` is the configuraion file.
- Can take a command to execute aswell where the enviroment variables are present. In the example above `envsubst` is being used.
- Because the output of the command is piped into `kubectl` status of the script is printed out in `stderr`. If this script is to be used in CI/CD. Then comment out the output to prevent the command from erroring out.
