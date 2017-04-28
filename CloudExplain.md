#### That's the (oversimplified) idea of cloud computing:

1) Companies such as Amazon and Google set up a huge amount of computers that are distributed across the world. <br/>
No one actually knows how large their total computing power is,
but it is expected to be comparable to top supercomputers in the world.  

2) A user requests a certain amount of computational resources, including CPU, memory and disk space. 
Then, some of the computers are assigned to (i.e. temporarily belong to) that specific user. 

3) The most typical way to remotely control those machines is still through the command line Secure Shell (SSH), 
which is exactly the same as working with your local servers.
The only thing new in cloud computing is the way to request and control computational resources. 
How to actually run programs on them is not too different.

#### Current status

Cloud computing platforms have been widely adopted by the data science community, to perform machine learning simulations that are often computationally intensive.

However, the cloud technology seems to be much less popular in the traditional scientific computing community. It is said that *"almost everything required by a scientic application is available in the cloud. The main challenge is then that, despite the low prices and flexible set of resources, the complex deployment and execution procedures are an obstacle for researchers to adopt the technology."*  (from *Chapter 6 Closing the Gap between Cloud Providers and Scientific Users"* of *Terzo, O., & Mossucca, L. (Eds.). (2015). Cloud computing with e-science applications. Crc Press.*)

But this challenge is mostly for developrs, not for users. I have found that users can skip almost all technical details and just perform the simulation in their familiar ways, once I finished building the system in the cloud and provided detailed tutorials for them.
