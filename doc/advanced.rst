Advanced Usages
===============

Save your system to preserve information after termination
----------------------------------------------------------

Click on "Create Image" to convert a snapshot of your system to an "AMI":

.. image:: img/12.png

This is the way to safely archive your system. You will only be charged by the storage for it. (~$0.05/GB/month, see https://aws.amazon.com/ebs/pricing/, "Amazon EBS Snapshots to Amazon S3")

The lifetime of an "instance" is from launching to termination. 
The lifetime of an "AMI" can be infinitely long if you don't delete it. 
An AMI can be used to launch any number of instances. 
You've already launched an instance from an AMI in Step 2 of the basic tutorial.
That's how I share the system-with-GEOSChem with you. 

I don't recommend to save this GEOS-Chem instance because it contains large amounts of data. 
A much cheaper way is to separate the core operating system and the data storage, 
but it is beyond the scope of this basic tutorial.

However, this "saving-and-relaunching" method is crucial to building you own sustainable system in cloud.

Use Spot Instances to minimize cost
-----------------------------------

https://aws.amazon.com/ec2/spot/spot-and-science/.
It can be 70%~80% cheaper than the standard ("on-demand") method.

A typical spot price is 0.01$/core/hour, 
which means less than $2.0 for a 1-month 4x5 run (need ~100 core\*hours).

The "price" you pay for this "free lunch" is that your server is not guaranteed to be 100% stable.
It has very little chance of shutting down 
(although I've launched a spot instance for weeks and never encountered this situation)
For maintaining a web server, that's intolerable, but it suits scientific computing pretty well.

Also, spot instance doesn't allow "stop", but only allows "terminate", 
which means you should have a clever use of saving AMIs and transfering data to other Amazon storage services.
