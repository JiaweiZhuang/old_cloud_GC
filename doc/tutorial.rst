.. _tutorial-label:

Beginner tutorial
=================

.. warning::
  This tutorial shows how to perform proof-of-concept GEOS-Chem simulations. 
  AWS has agreed to host all GEOS-Chem input data for free. After the data 
  transfer is done, I will add tutorials for real research workflow
  (`issue#4 <https://github.com/JiaweiZhuang/cloud_GC/issues/4>`_).

  The current version is the same as what was presented at 
  `IGC8 <http://acmg.seas.harvard.edu/geos/meetings/2017/index.html>`_ on May 2017. 
  I will provide a more up-to-date version soon
  (`issue#1 <https://github.com/JiaweiZhuang/cloud_GC/issues/1>`_).

Step 1: Sign up an Amazon Web Service(AWS) account
--------------------------------------------------
Go to http://aws.amazon.com, 
click on "sign in to the console" on the upper-right corner
（or you might see "create an AWS account").
Then you should see:

.. figure:: img/1.png
   :width: 400 px
   :alt: AWS login interface

After entering some basic information, you will be required to enter your credit card number:

.. image:: img/2.png

Don't worry, this tutorial will only cost you $0.1 :)

You can view the pricing at: https://aws.amazon.com/ec2/pricing/.
We will cover some of the jargons in that page throughout this tutorial.

(Optional) If you are a student, check out the $100 credit for AWS cloud computing:
https://aws.amazon.com/education/awseducate/.
I haven't used up my credit for after playing with AWS for several months, 
so haven't actually paid any money to them :)

Simply choose the basic plan when you encounter this page:

.. image:: img/3.png

Now you should have an AWS account! It's time to run the model in cloud. 

(You can skip Step 1 for the next time, of course)

Step 2: Launch a virtual server with GEOS-Chem installed 
--------------------------------------------------------
Log in to AWS console, and click on **EC2** (Elastic Compute Cloud), which is the cloud computing platform. 
Other options are other services such as storage. You don't need to care about them at this time.

.. image:: img/4.png

In the EC2 console, make sure you are in the "US East (N. Virginia)" region as shown 
in the upper-right corner of your console. Choosing regions closer to your physical location will give you 
better network. However, to keep this tutorial minimal, I built the system in only one region. 
But working across regions is straightforward.

.. image:: img/5a.png
   :width: 160 px

In the EC2 console, click on "AMI" (Amazon Machine Image) under "IMAGES" on the left of the page.

Select "Public images" and search for "ami-0b851a1d" or "cloud_GC_20170421" -- 
that's the system with GEOS-Chem installed. Select it and click on "Launch": 

.. image:: img/5.png

**This is one of the game-changing features of cloud computing.** An AMI means a copy of a specific system. 
I started with a brand new Linux operating system, and built GEOS-Chem 
(and all the necessary software, of course) on it. 
After that, everyone is able to get a perfect clone of my system, with everything installed correctly. 
This magic can hardly happen on traditional machines!
You can make any modifications you like to your copy, such as changing the model code, downloading more data or installing additional software. If you screw things up (e.g. install some bad software, delete the original files unintentionally...), you can launch again and start over.

You have already specified your operating system, or the "software" side of the virtual server. 
Then it's time to specify the "hardware" side, mostly about CPUs.

In this toy example, choose "Memory optimized"-"r4.large" to test GEOS-Chem with the minimum fee.

.. image:: img/6.png

There are many CPU options, including numbers and types. AWS free tier also gives you 750 free hours of "t2.micro", which
is the tiniest CPU. Its memory is too small to run GEOS-Chem, but it is good for testing library installation if you
need to.

**Then, just click on "Review and Launch". You don't need to touch most of the detailed options.**

For the first time of using EC2, you need to create and download a "KeyPair". 
This is equivalent to the password you enter to ssh to your local server. 
Here, such "password" is a file, being stored in your own computer. 
The only way to share your password with others is to share that file.

Use any name you like for that KeyPair, click on "Download Key Pair", and finally click on "Launch Instances".

(for the next time, you can simply select "Choose an existing Key Pair" and launch)

.. image:: img/7.png

Within < 1min of initialization, "Instance State" should become "running":

.. image:: img/8.png

Now your own server appears on the cloud!

Step 3: Log into the virtual server and run GEOS-Chem
-----------------------------------------------------
Select your instance, click on the "Connect" button near the blue "Launch Instance" button, then you should see this page:

.. image:: img/9.png

If you use Mac or Linux, copy the "ssh -i ..." command under "Example" in the above page. 

If you use Windows, please refer to the guide for
`MobaXterm <http://angus.readthedocs.io/en/2016/amazon/log-in-with-mobaxterm-win.html>`_
and `Putty <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html>`_
(Your life would probably be easier with MobaXterm).

Before using it to ssh to your server, you need to make some minor changes:

- cd to the directory that you store the Key Pair (preferably $HOME/.ssh)
- type "chmod 400 your\_key\_pair.pem" to change the permission.
- change the user name "root" to "ubuntu". (You'll be asked to use "ubuntu" if you keep "root")
- (optional) add -Y to allow x11 forwarding. 

Your terminal will look like this:

.. image:: img/10.png

That's a system with GEOS-Chem already built!

（**Trouble shooting: If you cannot ssh to it, the most likely cause is security 
configuration. Click on "Security Groups" in the EC2 Dashboard, set "Inbound" to "Anywhere" or "My IP"**）

You can test the compiliation by executing::
  
  $ cd ~/GCv11-02
  $ ./compile.sh

or just run the pre-compiled the model by::
  
  $ cd ~/GCv11-02/geosfp_4x5_standard
  $ ./geos

You should see standard compiling and running messages, starting with:

.. include:: ../log/test_compile.log
   :literal:
   :end-line: 6

.. include:: ../log/test_run.log
   :literal:
   :end-line: 6

Congratulations! You've just finished a GEOS-Chem simulation in cloud.

Here we only test an 1-hour run to demonstrate the capability of running GEOS-Chem in cloud.
The "r4.large" instance type we chose has only a single core (so it is cheap, ~$0.1/hour), 
while its memory is large enough for GEOS-Chem to start.
To test longer runs, it is recommended to use "Compute Optimized" instance types with multiple cores such as "c4.4xlarge".

Step 4: (Very important!) Shut down the instance after the simulation
---------------------------------------------------------------------
Right-click on the instance in your console to get a menu:

.. image:: img/11.png

There are two different ways to stop being charged:

- "stop" will make the system inactive, so that you'll not be charged by the CPU time, 
  and only be charged by the negligible storage fee. (~$0.1/GB/month, see https://aws.amazon.com/ebs/pricing/, "Amazon EBS General Purpose SSD (gp2) volumes")
- "terminate" will completely remove that virtual server so you won't be charged at all after that.
  Unless you save your system (see below), you will lose all your data and software.

That's the end of the basic tutorial. 
