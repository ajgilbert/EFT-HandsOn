# Hands-on EFT exercise

The goals of this exercise are to gain experience with event simulation, the parameterisation of effective field theory (EFT) effects, and some of the aspects of setting EFT constraints in data analysis.

## Software environment

This exercise can either be completed on the CERN `lxplus` service, or by setting up a similar environment using `Docker`.

### Docker

You only need to follow this part if using Docker on your own laptop, and you need to install it for the first time. If not, proceed to the next section below.

Download and install the Docker desktop app for your platform from https://www.docker.com.

Once installed, you should have the `docker` command available from the command line.

> Note, if using a new Mac with Apple Silicon, you may get better performance from enabling:
https://levelup.gitconnected.com/docker-on-apple-silicon-mac-how-to-run-x86-containers-with-rosetta-2-4a679913a0d5

TODO: run image, how to see files

### Download this repository

Either from your AFS area on lxplus, or inside the docker image created above, clone this repository:

```sh
git clone https://github.com/ajgilbert/EFT-HandsOn.git
cd EFT-HandsOn
```

Inside the `EFT-HandsOn` directory we will install the software needed for this exercise. The main tool we will use is **EFT2Obs**, which will itself install the **Madgraph5_aMC@NLO** Monte Carlo event generator, and the **RIVET** framework for defining analysis selections and observables.

To download **EFT2Obs** and complete the installation, run

```sh
./setup.sh
```

Note that to make sure everyone has a consistent software environment, this script will also checkout a CMSSW release (CMSSW_11_3_4).
Once the installation is complete, we will source the `setup.sh` script to set all the environment variables correctly. Note that you will need to run this in every new session:

```sh
source setup.sh
```
