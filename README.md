# Cloud-GC
## Running the GEOS-Chem CTM on cloud computing platforms

* Run GEOS-Chem without buying local machines -- get a virtual Linux server on the cloud in seconds 
* 1-month 4x5 standard chemistry simulation costs $1~2 -- no charge when you are not running the model
* No compilation error anymore-- all software and libraries are pre-installed

(All the other files in this repo are for myself to build cloud environments. Users only need to look at this page.)

## Tutorial
### Start a GEOS-Chem simulation within 10 minutes (and within 30 seconds for the next time) <br /> -- all you need is the computer you are currently using, to connect to the cloud.

#### Step 1: sign up an Amazon Web Service(AWS) account
Go to <br />
http://aws.amazon.com  <br />
Click on "sign in to the console". <br />
Then you should see:

<img src="img/1.png" width="480">

After entering some basic information, you will be required to enter you credit card number:

<img src="img/2.png" width="480">

Don't worry, this tutorial will only cost you $0.1 :) <br />

View the pricing at: <br />
https://aws.amazon.com/ec2/pricing/

If you are in academia, checkout the $100 credit for AWS cloud computing: <br />
https://aws.amazon.com/education/

Simply choose the basic plan when you encounter this page:
<img src="img/3.png" width="480">

Now you should have an AWS account! It's time to run the model in the cloud.

#### Step 2: launch a virtual server with GEOS-Chem installed 

Log into AWS console, and click on **EC2**(Elastic Compute Cloud), which is the cloud computing platform. 
Other options are other services such as storage. You don't need to care about them at this time.
<img src="img/4.png" width="480">

In the EC2 console, click on "AMI" (Amazon Machine learning) under "IMAGES" on the left of the page.

Select "Public images" and search for the AMI with GEOS-Chem installed. Select it and click on "Launch" 
<img src="img/5.png" width="480">

This the game-changing feature of cloud computing. An AMI means a copy of a specifc system. 
I started with a brand new Linux operating system, and built GEOS-Chem 
(and all the necessary software, of course) on it. 
Then, everyone is able to get a copy of my system, with everything installed correctly.

You have chosen your "software" or "operating system", then it's time to choose the hardware, mostly about CPUs.

In this toy example, choose "Memory optimized"-"r4.large" to test GEOS-Chem with the minimum fee.

<img src="img/6.png" width="480">

There are many CPU options (including numbers and types). AWS free tier also gives you 750 free hours of "t2.micro", which
is the tiniest CPU. Its memory is too small to run GEOS-Chem, but it is good for testing library installation if you
need to.

<br />

For the first time of using EC2, you need to create and download a "KeyPair". 
This is equivalent to the password you enter to ssh to your local server. 
Here, such "password" is a file, being stored in your own computer. 
The only way to share your password with others is to share that file.

- Use any name you like for that KeyPair 
- click on "Download Key Pair" <br/>
- click on "Launch Instances" <br/>

<img src="img/7.png" width="480">

<img src="img/8.png" width="480">

<img src="img/9.png" width="480">

Log in the run GEOS-Chem
<img src="img/10.png" width="480">

**Very important! Always remember to shut down the instance when you finish the simulation!**
<img src="img/11.png" width="480">

## Advanced Usages 

### Change the underlining hardware while keeping the operating system (software) untouched

### Use the "Spot Instance" to minimize the cost

https://aws.amazon.com/ec2/spot/spot-and-science/

<br/><br/><br/>
## Future Plans and Possible Directions

#### Update GEOS-Chem source code and post-processing tools 

* Make the public release of GEOS-Chem fully compatible with gfortran

The public release of v11-01 is now compatible with gfortran5 but not gfortran6. v11-02 (in development) works with gfortran6.

* Replace IDL with python, which is free and open-source 

I developed a python tool(https://bitbucket.org/gcst/gcpy) primarily for GCHP, but we will make it fully compatible with GEOS-Chem classic too.

It actually requires more change to the GEOS-Chem code than to the python code. 
Once GEOS-Chem can output all diagnostics in NetCDF format instead of in bpch format,
they can be very easily handled by any languages.

#### Design a strategy for long-term, economical workflow.

* Cheaper and more efficient data storage and sharing in cloud.

Currently I put all the input data under the root directory, 
which is convenient for illustration but bad for actual practice. 

Should make use of standalone *Amazon Elastic Block Store(EBS) volumes* and *Simple Storage Service (S3)* to store and share
data.

May refer to the CESM work: http://www.sciencedirect.com/science/article/pii/S0098300416304721

* How to handle unexpected shut-down for spot instances while still minimizing the cost?

Although there's only very little chance for spot instances to shut down, 
there should be a strategy to ensure the model runs safely.

#### Provide friendly tutorials for more complicated scientific computing tasks

Most of the documents on AWS cloud computing are not for scientists. They are full of computer system jargons.
They are not like GEOS-Chem wiki where you can often find useful solutions. 
That means, if you encounter any technical issues, you are likely to get more confused by looking through their documents.
That's the basic reason why I wrote this tutorial. 

But that's not their fault.
Although cloud computing is getting popular among the scientific computing community, 
the majorities of the cloud platform users are still web developers or system engineers, not scientists.

*Scientific Computing on Cloud --  the Guide for Dummies* has yet to be written. 

#### Look at more cloud computing platforms and seek collaborations

Besides Amazon EC2, Google Compute Engine and Microsoft Azure also provide similar services.

Many of their services have one-to-one mappings to AWS: <br />
https://cloud.google.com/docs/compare/aws/compute <br />
https://docs.microsoft.com/en-us/azure/architecture/aws-professional/

* Possible to get some research grants from them?

For example,

https://aws.amazon.com/research-credits/

https://research.google.com/research-outreach.html#/research-outreach/faculty-engagement/faculty-research-awards

#### Cooperate with other free, open-source community models like CESM and WRF?

* Something like cloud-computing-for-atmospheric-modeling-project?

Think of launching a virtual server with all commonly used models installed, and with the input data available.

The biggest trouble for users seems to be building the NetCDF library. 
Almost all earth science models need NetCDF, so it would be an one-for-all work.

## Additional resources

[1]*Cloud Computing in Ocean and Atmospheric Sciences[M]. Elsevier, 2016.* 
gives a nice overview of various cloud computing applications in our field.
It doesn't tell you how to actually do cloud computing, though.
