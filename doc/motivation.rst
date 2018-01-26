.. _motivation-label:

Remove technical barriers
=========================

Atmospheric scientists often need to waste time on non-science tasks:
installing software libraries, making models compile and run without bugs, 
preparing model input data, or even setting up a Linux server.

Those technical tasks are getting more and more challenging --
as atmospheric models evolve to incorporate more scientific understandings
and better computing technologies, they also need more complicated software, 
more computing power, and much more data.

Cloud computing can largely alleviate those problems. **The goal of this project is
to allow researchers to fully focus on scientific analysis, not
fighting with software and hardware problems.**

Software
--------

On the cloud, you can launch a server with everything configured correctly.
Once I have built the model and saved it as an `Amazon Machine Image (AMI) 
<https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html>`_, 
anyone can replicate exactly the same software environment and start using
the model immediately (see :ref:`tutorial-label`).
You will never see compile errors anymore.

This has more implications in the age of High-Performance Computing (HPC).
Modern atmospheric models are often built with complicated software frameworks,
notably the `Earth System Modeling Framework (ESMF) 
<https://www.earthsystemcog.org/projects/esmf/>`_. 
Those frameworks allow model developers to utilize HPC technologies without
writting tons of boilerplate `MPI <https://computing.llnl.gov/tutorials/mpi/>`_ code,
but they add extra burdens on model users --
installing and configuring those frameworks is daunting, if not impossible, 
for a typical graduate student without a CS background. Fortunately, 
no matter how difficult it is to install those libraries, there only needs to be
one person to build it once on the cloud. Then, no one needs to redo this labor again.

.. note::
  This software dependency hell can also be solved by containers such as
  `Docker <https://www.docker.com>`_ and `Singularity <http://singularity.lbl.gov>`_ 
  (e.g. `Docker-WRF <https://ral.ucar.edu/projects/ncar-docker-wrf>`_).
  But the cloud also solves compute and data problems, as discussed below.
  You can combine containers and cloud to have a consistent environment 
  across local machines and cloud platforms.

Compute 
-------

Local machines need up-front investment and have fixed capability.
Right before AGU, everyone is running models and jobs are pending forever in the queue. 
During Christmas, no one is working and machines are just idle but still incur maintenance cost.

Clouds are elastic. You can request an `HPC cluster <https://aws.amazon.com/hpc/>`_ 
with 1000 cores for just 1 hour, and only pay for exactly that hour. 
If you have powerful local machines, you can still use the cloud 
to boost computing power temporarily.

Data
----

GEOS-Chem currently have 30 TB of GEOS-FP/MERRA2 meteorological input data.
With a bandwidth of 1 MB/s, it takes two weeks to download a 1-TB subset 
and a year to download the full 30 TB. To set up a high-resolution
nested simulation, one often needs to spend long time getting the
corresponding meteorological fields. `GCHP <http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_HP>`_
can ingest global high-resolution data and will further push the data size to increase.

The new paradigm to solve this big data challenge is to "move compute to data",
i.e. perform computing directly in the cloud environment where data is already available.
(also see :ref:`earth-data-label`).
AWS has agreed to host all GEOS-Chem input data for free under the Public Data Set Program.
By having all the data already available in the cloud environment, 
you can perform simulations over any periods with any configurations.
