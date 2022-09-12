# Opioid Prescribing Support Implementation Guide (FHIR R4 (4.0.1))

This project is a joint effort by the Centers for Disease Control and Prevention (CDC) and the Office of the National Coordinator for Health IT (ONC) focused on improving processes for the development of standardized, shareable, computable decision support artifacts using the [CDC 2016 Opioid Prescribing Guideline](https://www.cdc.gov/mmwr/volumes/65/rr/rr6501e1.htm) as a model case.

The current draft of the implementation guide is available [here](http://build.fhir.org/ig/cqframework/opioid-cds-r4/). The draft is in the final stages of cleanup before publishing the initial 1.0 release.

The guide is published under a Creative Commons [license](LICENSE.md).

## Change Management and Roadmap

The guide currently includes artifacts to support all 12 recommendations contained in the Opioid Guideline. Next steps for this project include additional testing and piloting of the existing artifacts, as well as potential development of additional recommendations.

Feedback and issues can be submitted via the [issues](issues) page, and will be incorporated into subsequent releases as time and resources allow.

Contributions must follow the commit policy defined [here](/commit_policy.md)

## Repository and Build Information

This repository contains the source for the Opioid Prescribing Support Implementation Guide, and uses the [FHIR Implementation Guide publisher](http://wiki.hl7.org/index.php?title=IG_Publisher_Documentation) to produce a FHIR Implementation Guide.

Commits to this repository will automatically trigger a new build of the IG, which will then be published to the following location:

[http://build.fhir.org/ig/cqframework/opioid-cds-r4/](http://build.fhir.org/ig/cqframework/opioid-cds-r4/)

Debugging information is available here:

[http://build.fhir.org/ig/cqframework/opioid-cds-r4/debug.tgz](http://build.fhir.org/ig/cqframework/opioid-cds-r4/debug.tgz)

### Local Build

The HL7 IG Publisher is committed to this repository to make building as easy as possible. To build locally, clone the repository and issue the following command in the root:

    java -jar "org.hl7.fhir.publisher.jar" -ig ig.json

## Release and Branching

This repository will leverage a branching strategy to maintain multiple versions of opioid recommendations (currently 2016 and 2022) and their respective IG's. This will use semantic versioning on releases to make it clear which version of the recommendations the release is for. Any release for 2022 version will be v2022.#.# and any that are 2016 will be v2016.#.#. 

This will be developed from source branches for each version, master will be 2022 latest development, and v2016 will be latest development for 2016. This will leverage a gitflow type model where feature branches are made from respective branches and merged back to the parent via pull request and approved peer review. See diagram below

![branching](diagrams/BranchingStrategy.svg)

### IG Publishing

You can view latest development of the IG by going to the following locations:

#### v2016
[https://build.fhir.org/ig/cqframework/opioid-cds-r4/branches/v2016/](https://build.fhir.org/ig/cqframework/opioid-cds-r4/branches/v2016/)

#### v2022
[https://build.fhir.org/ig/cqframework/opioid-cds-r4/branches/master/](https://build.fhir.org/ig/cqframework/opioid-cds-r4/branches/master/)