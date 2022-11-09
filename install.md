---
layout: page
title: Installation instructions
---

I am happy to announce that we now have access to [RStudio Cloud](https://rstudio.cloud). This allows participants in this course to have access to a fully functioning copy of RStudio through their web browser that has all the packages installed and contains all the datasets and worksheets needed for the course. This is a "demo" version of RStudio that is only suitable for the workshop, and shouldn't be used to work on analyzing your own USDA data. 

You may also want to run all the R code locally on your own machine during the course. And if you want to continue using RStudio after the workshop, you will need to install everything on your own computer anyway. This page now contains two sets of instructions:

- [How to get access to RStudio Cloud](#accessing-rstudio-cloud)
- [How to install R, RStudio, and the needed packages locally](#installing-r-and-rstudio-locally)

## Accessing RStudio Cloud

> NOTE: Your RStudio Cloud access is for instructional purposes only. Please do not upload the government's data to this cloud server. To work with your USDA data using R, please install the software locally or use SciNet.

#### Step 1. Create account

![email signup](../public/images/rstudio_cloud_signup.png){: align="left" style="padding-right: 25px; float: left" height="300px" }

You will receive a signup link by email. Please let your instructor know if you need the link to be resent.

Open the link in your browser. You'll be prompted to either log in or sign up. Click "Sign Up" to create an account. Sign up with your usda.gov email account.
<br><br><br><br><br>

#### Step 2. Verify email

![email verification](../public/images/rstudio_cloud_verify_email.png){: align="left" style="padding-right: 25px; float: left; clear: left" height="300px" }

Verify the email address that you used to create the account.
{:style="clear: right"}
<br><br><br><br><br><br><br>

#### Step 3. Join workspace

![join space prompt](../public/images/rstudio_cloud_join_prompt.png){: align="left" style="padding-right: 25px; float: left; clear: left" width="300px" }

When you log in, you will be asked whether you want to join the "December 2022 Stats Workshop" workspace. Click "Yes"!
{:style="clear: right"}
<br><br><br>

#### Step 4. Open workspace

![navigation bar](../public/images/rstudio_cloud_left_bar.png){: align="left" style="padding-right: 25px; float: left; clear: left" height="300px" }

Select the December 2022 Stats Workshop space in the left-hand navigation bar.
{:style="clear: right"}
<br><br><br><br><br><br><br>

#### Step 5. Open project

![content pane](../public/images/rstudio_cloud_content.png){: align="left" style="padding-right: 25px; float:left; clear: left" width="400px" }

In the central pane you will be able to see the projects associated with this workspace. Currently there is only one, called "Lessons." Click on it to enter the "Lessons" project space. 
{:style="clear: right"}

This will bring up a new RStudio session with all the needed packages installed, the worksheets in a folder called `worksheets` and the datasets in a folder called `datasets`. You can run all the code you need for this workshop right from your browser!
{:style="clear: right"}

## Installing R and RStudio locally

The following instructions describe how to set up the software installation on your own machine.

### What you need to install

Before the course, you will need to have the following software installed on your laptop:

- R 
- RStudio
- R packages:
  + [tidyverse](https://www.tidyverse.org/) (this includes the packages [dplyr](https://dplyr.tidyverse.org/), [tidyr](https://tidyr.tidyverse.org/), [readr](https://readr.tidyverse.org/), and [ggplot2](https://ggplot2.tidyverse.org/) that we will be working with)
  + [lme4](https://cran.r-project.org/web/packages/lme4/index.html)
  + [emmeans](https://cran.r-project.org/web/packages/emmeans/index.html)

In addition, you will need to download the example datasets.
  
#### Step 1. Install R

You will need to download R from [The Comprehensive R Archive Network](https://cran.r-project.org/), or CRAN. CRAN is a team of developers that maintain R and manage the packages that users contribute.

![CRAN R download screenshot](../public/images/cran_screenshot.png){: align="left" style="padding-right: 25px" width="400px" }

Go to the [CRAN website](https://cran.r-project.org/) and select the link to download the most recent version of R for your operating system. Follow the installation instructions. You will need admin rights to do this so you may need to get help from your IT staff.

#### Step 2. Install RStudio

RStudio is an additional software program that makes it easy for you to write R code. It provides an interface that lets you run code, edit scripts, see what variables are in your working environment, and manage files. *RStudio is a program that makes it easier to use R, but you need to download both R and RStudio separately.*

![Posit RStudio download screenshot](../public/images/posit_screenshot.png){: align="left" style="padding-right: 25px" width="300px" }

As of early November 2022, RStudio is now distributed by a company called Posit. Go to the [RStudio Desktop download page](https://posit.co/download/rstudio-desktop/) and download the free version of RStudio Desktop. Again, you will need admin rights to do this on your USDA machine.

#### Step 3. Install R packages

To install the packages we will be working with in this course, you will need to either install packages by typing a command into the R console, or install them using RStudio's package installation window. 

> **NOTE**: On some Windows systems, the default R package installation directory is inside the `Program Files` directory. Please ask your IT person to change the default R package installation directory to one that you have administrator rights to. This will allow you to install R packages in the future without involvement from an administrator.

##### Installing packages from the R console

- Open RStudio.
- Type the following command into the R console and press enter. Voila!

```
install.packages(c("tidyverse", "lme4", "lmerTest", "emmeans"))
```

##### Installing packages from the RStudio package installation window

You can also install the packages using the RStudio package installation dialog.

- The files pane has a tab called "Packages." Click on that and click the "Install" button in the upper left.
- Type the package names, separated by space or comma, into the box:

```
tidyverse, lme4, lmerTest, emmeans
```

It should look like this:

![installation dialog](../public/images/install_dialog.png)

- Ensure that the library you are installing to is somewhere in a folder you can write to without admin rights. (See above.) 
- Ensure that "install dependencies" is selected.
- Click "Install."

#### Step 4. Download the worksheets and example datasets

The [worksheets and example datasets]({{ site.baseurl}}/worksheets) are available for download on this site. 
