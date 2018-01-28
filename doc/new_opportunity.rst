.. _new-opportunity-label:

Open new research opportunities
===============================

Cloud not only makes model simulations much easier, but also opens many new
research opportunities in Earth science. 

.. _earth-data-label:

Massive Earth observation data
------------------------------

Massive amounts of satellite and other Earth science data are being moved to the cloud.
One success story is the migration of NOAA's NEXRAD data to AWS
(`Ansari et al., 2017, BAMS <https://journals.ametsoc.org/doi/abs/10.1175/BAMS-D-16-0021.1>`_) --
it is reported that "data access that previously took 3+ years to complete now requires only a few days"
(`NAS, 2018 <https://www.nap.edu/catalog/24938/thriving-on-our-changing-planet-a-decadal-strategy-for-earth>`_,
Chapter "Data and Computation in the Cloud").
By learning cloud computing you can get access to massive
`Earth science datasets on AWS <https://aws.amazon.com/earth/>`_,
without having to spend long time downloading them to local machines.

The most exciting project is perhaps 
`the cloud migration of NASA’s Earth Observing System Data and Information System (EOSDIS)
<https://earthdata.nasa.gov/about/eosdis-cloud-evolution>`_.
It will open new opportunities such as ultra-high-resolution inversion of satellite data,
leveraging massive data and computing power available on the cloud.
This kind of analysis will be hard to imagine on traditional platforms.

.. _deep-learning-label:

Deep learning and AI
--------------------

There is a growing interest in applying machine learning in Earth science, 
as illustrated clearly by the AGU 2017 Fall meeting 
(`H082 <https://agu.confex.com/agu/fm17/preliminaryview.cgi/Session22660>`_, 
`A028 <https://agu.confex.com/agu/fm17/preliminaryview.cgi/Session26710>`_)
and AMS 2018 meeting
(`AMS-AI <https://ams.confex.com/ams/98Annual/webprogram/17AI.html>`_,
and `its summary <https://ams.confex.com/ams/98Annual/webprogram/Handout/Paper329697/
Current_State_of_Artificial_Intelligence_Exploitation_in_AMS_Community_Final_122017.pdf>`_).

Cloud platforms are the go-to choice for training machine learning models, especially 
deep neural networks. There are massive amounts of GPUs on the cloud,
which can offer `~50x performance <https://github.com/jcjohnson/cnn-benchmarks>`_ 
than CPUs for training neural nets. Pre-configured environment on the cloud
(e.g. `AWS Deep Learning AMI <https://aws.amazon.com/machine-learning/amis/>`_)
allows users to run the program immediately without wasting time configuring 
GPU libraries (mostly `cuDNN <https://developer.nvidia.com/cudnn>`_).

Instructions on using cloud are often included in the official documentations of ML/DL frameworks:

- `Keras on AWS GPU <https://blog.keras.io/running-jupyter-notebooks-on-gpu-on-aws-a-starter-guide.html>`_.
  Keras is the most popular high-level deep learning library, built on top of TensorFlow.

- `XGBoost on AWS cluster <https://xgboost.readthedocs.io/en/latest/tutorials/aws_yarn.html>`_.
  XGBoost is the most popular library for 
  `gradient boosting <https://xgboost.readthedocs.io/en/latest/model.html>`_,
  and is also `the most widely used tool in Kaggle 
  <http://blog.kaggle.com/2017/01/23/a-kaggle-master-explains-gradient-boosting/>`_.

... and in deep learning textbooks and course materials:

- `Stanford CS231n: Convolutional Neural Networks for Visual Recognition 
  <http://cs231n.github.io/>`_. 
  See `Google Cloud Tutorial <http://cs231n.github.io/gce-tutorial/>`_ and 
  `AWS Tutorial <http://cs231n.github.io/aws-tutorial/>`_. 
  (CS231n should be one of the most popular deep learning courses, 
  with all videos and materials freely available online)

- `Deep learning with Python <https://www.manning.com/books/deep-learning-with-python>`_.
  by François Chollet, the author of Keras. See Appendix B. Running Jupyter notebooks on AWS GPU. 
  (This book `got full 5-star on Amazon 
  <https://www.amazon.com/Deep-Learning-Python-Francois-Chollet/dp/1617294438>`_)

- `Deep Learning - The Straight Dope <http://gluon.mxnet.io/index.html>`_.
  It is a very nice interactive textbook on deep learning.
  Its `official Chinese version <https://zh.gluon.ai/>`_ has
  `an instruction on using AWS <https://zh.gluon.ai/chapter_preface/aws.html>`_.
  See `AWS official docs <https://docs.aws.amazon.com/mxnet/latest/dg/gs.html>`_
  for the equivalent English version.
