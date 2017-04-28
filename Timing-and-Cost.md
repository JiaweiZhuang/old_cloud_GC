### 1-month timing and preliminary cost analysis

### Test specification

* 1-month 4x5 standard chemistry (UCX included) simulation <br/>
* Default time step (10min for dynamics and 20min for chemistry) <br/>
* NEI2011 disabled to save storage <br/>
* Version: the newest v11-02 (bleeding egde version) <br/>

### Hardware&software

 * CPU: "c4.4xlarge" containing 16 CPUs [(detail)](log/cpuinfo.log) <br/>
 * compiler: gfortran-6 <br/>

### Total time use: **5h50min**  

 * [detail](log/timing_1month_c4.4xlarge_1500IOPS.log) <br/>

### Estimated simulation cost: **$1.2**

 * Spot price for "c4.4xlarge" around $0.2/hour at the time the test was performed <br/>aaaaaa
 * Charged for 6 hours, $0.2*6=$1.2 <br/>
 * Storage cost is less than an order of magnitude <br/>
