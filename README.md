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

To download and run the docker image:

```sh
docker run --cap-add SYS_ADMIN --device /dev/fuse -it gitlab-registry.cern.ch/agilbert/eft-exercise-docker:snapshot /bin/bash
```

The software needed for the exercise is already installed in the image, within the `EFT-HandsOn` directory.
Instructions for setting up the software on lxplus are given below.

### lxplus

First clone this repository somewhere:

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

### Install the SMEFTsim models

```sh
./scripts/setup_model_SMEFTsim3.sh
```

If we now look inside the Madgraph `models` directory, we'll see the different variants of the SMEFTsim model:

```sh
ls -1 MG5_aMC_v2_6_7/models/
SMEFTsim_MFV_MwScheme_UFO
SMEFTsim_MFV_alphaScheme_UFO
SMEFTsim_U35_MwScheme_UFO
SMEFTsim_U35_alphaScheme_UFO
SMEFTsim_general_MwScheme_UFO
SMEFTsim_general_alphaScheme_UFO
SMEFTsim_topU3l_MwScheme_UFO
SMEFTsim_topU3l_alphaScheme_UFO
SMEFTsim_top_MwScheme_UFO
SMEFTsim_top_alphaScheme_UFO
[...]
```

### Generate a process

Create `cards/Higgs-VBF/proc_card.dat`:

```
import model SMEFTsim_topU3l_MwScheme_UFO-massless

define e = e+ e-
define mu = mu+ mu-

generate p p > h j j $$ w+ w- z a QCD=0 NP<=1, h > e mu vl vl~ NP=0

output Higgs-VBF
```

<!-- ###

We will base our analysis on the H->WW: https://cms-results.web.cern.ch/cms-results/public-results/publications/HIG-20-013/index.html  -->