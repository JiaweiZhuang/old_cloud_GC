### 1-month timing and preliminary cost analysis

Test specification:
    - 1-month 4x5 standard chemistry (UCX included) simulation
    - Default time step (10min for dynamics and 20min for chemistry)
    - NEI2011 disabled to save storage
    - Version: the newest v11-02 (bleeding egde version)

Hardware&software:
    - CPU: "c4.4xlarge" containing 16 CPUs [(detail)](log/cpuinfo.log)
    - compiler: gfortran-6

Total time use: **5h50min**  
    - [(detail)](log/timing_1month_c4.4xlarge_1500IOPS.log)

Estimated simulation cost: **$1.2**
    - Spot price around $0.2/hour at the time the test was performed
    - Charged for 6 hours, $0.2*6=$1.2
    - Storage cost is less than an order of magnitude
