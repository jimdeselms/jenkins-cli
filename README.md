# jenkins-cli-builder #

This repository contains everything you need to build a docker image that you can use to run Jenkins CLI commands against your Jenkins server so that you don't have to install the dependencies yourself.

The Jenkins CLI exposes a bunch of capabilities for automating Jenkins, for example, creating new jobs, setting up new nodes, etc.

## Building the image ##

Before you build this image, you'll need three things:
* A name for the image that makes sense for your purposes
* The URL for your Jenkins server, for example <pre>https://myjenkins.mycompany</pre>
* An API token. You can get this from your user's configure page, for example <pre>https://myjenkins.mycompany/user/yourname/configure</pre>

These examples are on a single line for clarity; you can either run them all on one line, or use the multi-line character appropriate for your scripting language.

<pre>
docker build -t <i>your-image-name</i> 
    --build-arg HOST=https://<i>yourhostname</i> 
    --build-arg AUTH=<i>yourName</i>:<i>yourApiToken</i> 
    .
</pre>

For example:

<pre>
docker build -t freds-jenkins-cli 
    --build-arg HOST=https://fredsjenkins 
    --build-arg AUTH=fredwilkerson:4267b5d3451b372fd592613ee85e2e7fa</i> 
    .
</pre>

## Running the container ##

The easiest way to run the container is to just run it and pass arguments to the Jenkins cli.

Alternatively, the image exposes a shell command "jenkins" which you can run interactively.

For the examples below, I'll use the image name "`freds-jenkins-cli`".

### Running as a one-line command ###

You can pass commands directly in "docker run" and they'll be passed directly into the "jenkins" script:

```
docker run --rm freds-jenkins-cli who-am-i
```

### Running interactively ###

You can also run the container interactively, passing commands to the "jenkins" command in the container:

```
docker run -it --rm freds-jenkins-cli
```

Then, when you get to the shell prompt, you can run the commands using the "jenkins" script:

```
# jenkins help
# jenkins who-am-i
```

